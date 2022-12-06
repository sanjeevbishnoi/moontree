import 'package:dartz/dartz.dart';
import 'package:wallet_utils/wallet_utils.dart' as validation;
import 'package:moontree/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validatePrivKey(String key) {
  if (!validation.isPrivateKey(key)) {
    return left(ValueFailure.invalidPrivKey(key));
  } else {
    return right(key);
  }
}

Either<ValueFailure<String>, String> validatePubKey(String key) {
  if (!validation.isPublicKey(key)) {
    return left(ValueFailure.invalidPubKey(key));
  } else {
    return right(key);
  }
}

Either<ValueFailure<String>, String> validateDerivationPath(String key) {
  if (!validation.isDerivationPath(key)) {
    return left(ValueFailure.invalidDerivationPath(key));
  } else {
    return right(key);
  }
}
