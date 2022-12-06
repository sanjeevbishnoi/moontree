import 'package:dartz/dartz.dart';
import 'package:wallet_utils/wallet_utils.dart' as validation;
import 'package:moontree/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateFullName(String name) {
  if (boolValidateFullName(name)) {
    return left(ValueFailure.invalidFullName(name));
  } else {
    return right(name);
  }
}

bool boolValidateFullName(String name) {
  if (!validation.isAssetPath(name.toUpperCase()) &&
      !validation.isRavencoinPath(name.toUpperCase())) {
    return false;
  } else {
    return true;
  }
}
