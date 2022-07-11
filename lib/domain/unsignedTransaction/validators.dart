import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateTxHash(String txHash) {
  if (txHash == '') {
    return left(ValueFailure.invalidTxHash(txHash));
  } else {
    return right(txHash);
  }
}
