import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/core/value_failures.dart';
import 'package:moontree_layer_flutter/utils/validation.dart';

Either<ValueFailure<String>, String> validateTxId(String txId) {
  if (!isTxIdRVN(txId)) {
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
