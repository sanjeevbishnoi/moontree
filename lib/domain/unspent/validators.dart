import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateLockingScript(String script) {
  if (script.isEmpty) {
    return left(ValueFailure.invalidLockingScript(script));
  } else {
    return right(script);
  }
}
