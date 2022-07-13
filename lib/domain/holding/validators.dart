import 'package:dartz/dartz.dart';
import 'package:ravencoin_wallet/ravencoin_wallet.dart' show Validation;
import 'package:moontree/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateFullName(String name) {
  if (!Validation.isAssetPath(name.toUpperCase()) &&
      !Validation.isRavencoinPath(name.toUpperCase())) {
    return left(ValueFailure.invalidFullName(name));
  } else {
    return right(name);
  }
}
