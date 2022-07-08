import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/utils/validation.dart';

Either<ValueFailure<String>, String> validatePrivKey(String key) {
  if (!isPrivateKey(key)) {
    return left(ValueFailure.invalidPrivKey(key));
  } else {
    return right(key);
  }
}

Either<ValueFailure<String>, String> validatePubKey(String key) {
  if (!isPublicKey(key)) {
    return left(ValueFailure.invalidPubKey(key));
  } else {
    return right(key);
  }
}

Either<ValueFailure<String>, String> validateDerivationPath(String key) {
  if (!isDerivationPath(key)) {
    return left(ValueFailure.invalidDerivationPath(key));
  } else {
    return right(key);
  }
}
