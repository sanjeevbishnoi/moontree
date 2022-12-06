import 'package:dartz/dartz.dart';
import 'package:wallet_utils/wallet_utils.dart' as validation;
import 'package:moontree/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateTxId(String txId) {
  if (!validation.isTxIdRVN(txId)) {
    return left(ValueFailure.invalidTxId(txId));
  } else {
    return right(txId);
  }
}

Either<ValueFailure<int>, int> validateTxConfirmations(int txConfirmations) {
  if (txConfirmations < 0) {
    return left(ValueFailure.invalidTxConfirmations(txConfirmations));
  } else {
    return right(txConfirmations);
  }
}

/// honestly should we even validate this? would this work for other timzones?
Either<ValueFailure<DateTime>, DateTime> validateTxDate(DateTime txDate) {
  //if (DateTime.now().isBefore(txDate)) {
  //  return left(ValueFailure.invalidTxDate(txDate));
  //} else {
  return right(txDate);
  //}
}
