import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree/utils/extensions/string.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/send/entity.dart';
import 'package:moontree/domain/send/values.dart';
import 'package:moontree/domain/unspent/entity.dart';
import 'package:moontree/domain/unsignedTransaction/values.dart';
import 'package:moontree/domain/unsignedTransaction/entity.dart';
import 'package:moontree/domain/unsignedTransaction/failure.dart';
import 'package:moontree/domain/unsignedTransaction/util.dart' as util;
import 'package:ravencoin_wallet/ravencoin_wallet.dart' as ravencoin;

@Environment('test')
@Injectable()
class UnsignedTransactionService {
  const UnsignedTransactionService();

  /// signs it
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>> sign(
    UnsignedTransaction unsignedTransaction,
  ) async {
    return right(await _sign(unsignedTransaction: unsignedTransaction));
  }

  /// Uses send information and the list of unspents to create an unsignedTransaction
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>> create({
    required Send send,
    required List<Unspent> selectedUnspents,
    Amount? fee,
  }) async {
    return right(_create(unspents: selectedUnspents, send: send, fee: fee));
  }

  UnsignedTransaction _create({
    required List<Unspent> unspents,
    required Send send,
    Amount? fee,
  }) {
    ravencoin.TransactionBuilder txb = ravencoin.TransactionBuilder(
      network: ravencoin.testnet, // how do we determin this? ravencoin.testnet
    );

    /// add each unspent to transaction
    Amount totalSpend = Amount(0);
    for (var unspent in unspents) {
      print(unspent.txId);
      txb.addInput(unspent.txId.getOrCrash(), unspent.position.getOrCrash());
      totalSpend += unspent.amount;
    }

    /// add return amount
    Amount change = totalSpend - send.amount - (fee ?? Amount(0));
    if (change.getOrCrash() > 0) {
      txb.addOutput(send.change.getOrCrash(), change.asSats);
    }

    /// add output
    txb.addOutput(
      send.address.getOrCrash(),
      send.amount.asSats,
      asset: null, // only support rvn now
      memo: null, //estimate.assetMemo, // (.base58Decode)
      expiry: null, //assetMemoExpiry, // null is fine
    );

    /// add send.memo
    /// add opreturn memo
    // what if they actually want to put empty string here? null?...
    if (send.memo.get() != '') {
      txb.addMemo(send.memo.getOrCrash());
    }

    /// set unsignedTransaction.fee
    // (if we move this out, we can make the process slightly more efficient
    // but a bit more complicated)
    ravencoin.Transaction tx = txb.buildSpoofedSigs();
    int feeAsSats = tx.fee(
        goal: send.feeSelection == FeeSelection.fast
            ? ravencoin.TxGoals.fast
            : ravencoin.TxGoals.standard);

    return UnsignedTransaction(
        fee: Amount.fromSats(feeAsSats),
        signed: false,
        txHash: TxHash(tx.getHash().toEncodedString),
        txBuilder: txb,
        tx: tx,
        chosenUnspents: unspents);
  }

  Future<UnsignedTransaction> _sign({
    required UnsignedTransaction unsignedTransaction,
  }) async {
    ravencoin.TransactionBuilder txb = unsignedTransaction.txBuilder;
    await txb.signEachInput(unsignedTransaction.chosenUnspents);
    unsignedTransaction = unsignedTransaction.copyWith(txBuilder: txb);
    unsignedTransaction =
        unsignedTransaction.copyWith(tx: unsignedTransaction.txBuilder.build());
    return unsignedTransaction;
  }
}
