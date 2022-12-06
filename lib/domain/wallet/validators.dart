import 'package:dartz/dartz.dart';
import 'package:wallet_utils/wallet_utils.dart' as validation;
import 'package:moontree/domain/core/value_failures.dart';

Either<ValueFailure<String>, String> validateWalletName(String walletName) {
  if (walletName.isEmpty /* TODO && doesn't already exist in wallets... */) {
    return left(ValueFailure.invalidWalletName(walletName));
  } else {
    return right(walletName);
  }
}

Either<ValueFailure<String>, String> validateHashedEntropy(String entropy) {
  if (entropy.length != 64 /* TODO a guess */) {
    return left(ValueFailure.invalidHashedEntropy(entropy));
  } else {
    return right(entropy);
  }
}

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

Either<ValueFailure<String>, String> validatePubKeyAddress(String key) {
  if (!validation.isPublicKeyAddress(key)) {
    return left(ValueFailure.invalidPubKeyAddress(key));
  } else {
    return right(key);
  }
}
