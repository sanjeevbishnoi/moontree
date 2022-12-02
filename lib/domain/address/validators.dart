import 'package:dartz/dartz.dart';
import 'package:wallet_utils/wallet_utils.dart' show Validation;
import 'package:moontree/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validatePrivKey(String key) {
  if (!Validation.isPrivateKey(key)) {
    return left(ValueFailure.invalidPrivKey(key));
  } else {
    return right(key);
  }
}

Either<ValueFailure<String>, String> validatePubKey(String key) {
  if (!Validation.isPublicKey(key)) {
    return left(ValueFailure.invalidPubKey(key));
  } else {
    return right(key);
  }
}

Either<ValueFailure<String>, String> validateDerivationPath(String key) {
  if (!Validation.isDerivationPath(key)) {
    return left(ValueFailure.invalidDerivationPath(key));
  } else {
    return right(key);
  }
}
