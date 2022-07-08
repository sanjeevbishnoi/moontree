import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/utils/validation.dart';

Either<ValueFailure<String>, String> validateFullName(String name) {
  if (!isAssetPath(name.toUpperCase()) &&
      !isRavencoinPath(name.toUpperCase())) {
    return left(ValueFailure.invalidFullName(name));
  } else {
    return right(name);
  }
}
