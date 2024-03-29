import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/domain/transaction/values.dart';
import 'package:moontree/domain/transactionDetail/failure.dart';
import 'package:moontree/domain/transactionDetail/irepository.dart';
import 'package:moontree/domain/transactionDetail/values.dart';
import 'package:moontree/domain/transactionDetail/entity.dart';
import 'package:moontree/foundation/domain_model/joins/joins.dart';
import 'package:moontree/foundation/domain_model/records/transaction.dart';

@Environment('prod')
@Injectable(as: ITransactionDetailRepository)
class TransactionDetailRepository implements ITransactionDetailRepository {
  const TransactionDetailRepository();

  @override
  Future<Either<TransactionDetailFailure, TransactionDetail>>
      getTransactionDetail() async {
    return right(
      TransactionDetail(
        txId: TxId(
            'd6a0532aff8d1c075e5cb97ae595e4323c909bc527dcad86321cc074b4c12adc'),
        type: TxType(TxTypes.transfer),
        sentReceived: SentReceived.received,
        amount: Amount(0.0),
        confirmations: TxConfirmations(0),
        date: TxDate(DateTime.now()),
        fullName: FullName('RVN'),
        assetType: AssetType.currency,
        name: Name('Ravencoin'),
        fees: Fees({FeeType.transaction: Amount(0)}),
        ipfsHash: IpfsHash(''),
        note: Note(''),
        memo: Memo(''),
      ),
    );
  }

  @override
  Future<Either<TransactionDetailFailure, TransactionDetail>>
      getTransactionDetailOf(DomainTransaction tx) async {
    return right(
      TransactionDetail(
        txId: TxId(tx.hash),
        type: TxType(tx.type),
        sentReceived: tx.sentReceived,
        amount: Amount(tx.amount),
        confirmations: TxConfirmations(
            0), // TxConfirmations(tx.confirmations), not captured yet
        date: TxDate(DateTime.now()), // TxDate(tx.date), not caputred yet
        fullName: FullName(tx.symbol),
        assetType: tx.asset.assetType,
        name: Name(tx.asset.name),
        fees: Fees({FeeType.transaction: Amount(tx.feeAmount)}),
        ipfsHash: IpfsHash(''), //tx.ipfsHash),// not captured yet
        note: Note(''), //tx.note // not captured yet
        memo: Memo(''), //tx.memo // not captured yet
      ),
    );
  }
}
