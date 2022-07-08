// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/send/entity.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/entity.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/failure.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/irepository.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/service_dev.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';
import 'package:moontree_layer_flutter/domain/unspent/service.dart';
import 'package:moontree_layer_flutter/utils/dev.dart';
import 'package:moontree_layer_flutter/utils/extensions/list.dart';

@Environment('dev')
@Injectable(as: IUnsignedTransactionRepository)
class UnsignedTransactionRepository implements IUnsignedTransactionRepository {
  const UnsignedTransactionRepository();

  @override
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>>
      generateUnsignedTransaction(
    Send send,
  ) async {
    Amount amountPlusFee(Send send, UnsignedTransaction? unsignedTransaction) =>
        send.amount + (unsignedTransaction?.fee ?? Amount(0));

    await simulateWait('UnsignedTransactionRepository');

    // guards
    if (send.hasNoRavencoin)
      return left(UnsignedTransactionFailure.sendHasNoRavenForFee());
    if (send.amountTooLarge)
      return left(
          UnsignedTransactionFailure.sendAmountLargerThanSendUnspents());

    // logic
    UnspentService _unspentService = UnspentService();
    UnsignedTransactionService _unsignedTransactionService =
        UnsignedTransactionService();
    List<Unspent> _ravenUnspents;
    UnsignedTransaction? _unsignedTransaction;
    Amount _ravenAmount = Amount(0);
    bool _largestFirst = false;
    while (amountPlusFee(send, _unsignedTransaction) > _ravenAmount) {
      _ravenUnspents = await _unspentService
          .selectUnspents(
            unspents: send.ravenUnspents,
            amount: send.amount,
            fee: _unsignedTransaction?.fee ?? Amount(0),
            largestFirst: _largestFirst,
          )
          .then(
            (value) => value.getOrElse(() => throw Exception(
                'could not select unspents, TODO return failure here')),
          );
      _ravenAmount = _ravenUnspents.sum();
      // guard - fee plus amount
      if (amountPlusFee(send, _unsignedTransaction) > _ravenAmount) {
        if (!_largestFirst) {
          _largestFirst = true;
          continue;
        }
        return left(UnsignedTransactionFailure
            .sendAmountAndFeeLargerThanSendUnspents());
      }
      _unsignedTransaction = await _unsignedTransactionService
          .create(
            send: send,
            selectedUnspents: _ravenUnspents,
            fee: _unsignedTransaction?.fee ?? Amount(0),
          )
          .then(
            (value) => value.getOrElse(() => throw Exception(
                'could not create UnsignedTransaction, TODO return failure here')),
          );
    }
    return _unsignedTransaction == null
        ? left(UnsignedTransactionFailure.invalidUnsignedTransaction())
        : right(_unsignedTransaction);
  }

  @override
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>>
      generateUnsignedTransactionAsset(
    Send send,
  ) async {
    Amount amountPlusFee(Send send, UnsignedTransaction? unsignedTransaction) =>
        send.amount + (unsignedTransaction?.fee ?? Amount(0));

    await simulateWait('UnsignedTransactionRepository');

    // guards
    if (send.hasNoRavencoin)
      return left(UnsignedTransactionFailure.sendHasNoRavenForFee());
    if (send.amountTooLarge)
      return left(
          UnsignedTransactionFailure.sendAmountLargerThanSendUnspents());

    // logic
    UnspentService _unspentService = UnspentService();
    List<Unspent> _ravenUnspents;
    List<Unspent>? _assetUnspents;
    UnsignedTransaction? _unsignedTransaction;
    Amount _ravenAmount = Amount(0);
    Amount _assetAmount = Amount(0);
    bool _largestFirst = false;
    while (send.amount > _assetAmount ||
        (_unsignedTransaction?.fee ?? Amount(100)) > _ravenAmount) {
      if (send.amount > _assetAmount || _assetUnspents == null) {
        _assetUnspents = await _unspentService
            .selectUnspents(
              unspents: send.assetUnspents,
              amount: send.amount,
              fee: Amount(0),
              largestFirst: _largestFirst,
            )
            .then(
              (value) => value.getOrElse(() => throw Exception(
                  'could not select unspents, TODO return failure here')),
            );
        _assetAmount = _assetUnspents!.sum();
        if (send.amount > _assetAmount) {
          if (!_largestFirst) {
            _largestFirst = true;
            continue;
          }
          return left(UnsignedTransactionFailure
              .sendAmountAndFeeLargerThanSendUnspents());
        }
      }
      while ((_unsignedTransaction?.fee ?? Amount(100)) > _ravenAmount) {
        _ravenUnspents = await _unspentService
            .selectUnspents(
              unspents: send.ravenUnspents,
              amount: Amount(0),
              fee: _unsignedTransaction?.fee ?? Amount(0),
              largestFirst: _largestFirst,
            )
            .then(
              (value) => value.getOrElse(() => throw Exception(
                  'could not select unspents, TODO return failure here')),
            );
        _ravenAmount = _ravenUnspents.sum();
        // guard - fee plus amount
        if (amountPlusFee(send, _unsignedTransaction) > _ravenAmount) {
          if (!_largestFirst) {
            _largestFirst = true;
            break;
          }
          return left(UnsignedTransactionFailure
              .sendAmountAndFeeLargerThanSendUnspents());
        }
        _unsignedTransaction = await UnsignedTransactionService()
            .create(
              send: send,
              selectedUnspents: _ravenUnspents + _assetUnspents,
              fee: _unsignedTransaction?.fee ?? Amount(0),
            )
            .then(
              (value) => value.getOrElse(() => throw Exception(
                  'could not create UnsignedTransaction, TODO return failure here')),
            );
      }
    }
    return _unsignedTransaction == null
        ? left(UnsignedTransactionFailure.invalidUnsignedTransaction())
        : right(_unsignedTransaction);
  }

  @override
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>>
      generateUnsignedTransactionSweepOne(
    Send send,
  ) async {
    await simulateWait('UnsignedTransactionRepository');
    final unspents =
        send.isSendingRavencoin ? send.ravenUnspents : send.assetUnspents;
    UnsignedTransaction toGetFee = await UnsignedTransactionService()
        .create(
          send: send,
          selectedUnspents: unspents,
        )
        .then(
          (value) => value.getOrElse(() => throw Exception(
              'could not create UnsignedTransaction, TODO return failure here')),
        );
    UnsignedTransaction unsignedTransaction = await UnsignedTransactionService()
        .create(
          send: send.copyWith(amount: send.amount - toGetFee.fee),
          selectedUnspents: unspents,
          fee: toGetFee.fee,
        )
        .then(
          (value) => value.getOrElse(() => throw Exception(
              'could not create UnsignedTransaction, TODO return failure here')),
        );
    return right(unsignedTransaction);
  }
}
