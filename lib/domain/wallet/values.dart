import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/core/value_object.dart';
import 'package:moontree_layer_flutter/domain/core/value_failures.dart';
import 'package:moontree_layer_flutter/domain/wallet/validators.dart';

class WalletName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const WalletName._(this.value);

  factory WalletName(String walletName) =>
      WalletName._(validateWalletName(walletName));
  factory WalletName.empty() => WalletName('');
}

class HashedEntropy extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const HashedEntropy._(this.value);

  factory HashedEntropy(String entropy) =>
      HashedEntropy._(validateHashedEntropy(entropy));
  factory HashedEntropy.empty() => HashedEntropy('');
}

class PrivKey extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const PrivKey._(this.value);

  factory PrivKey(String key) => PrivKey._(validatePrivKey(key));
  factory PrivKey.empty() => PrivKey('');
}

class PubKey extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const PubKey._(this.value);

  factory PubKey(String key) => PubKey._(validatePubKey(key));
  factory PubKey.empty() => PubKey('');
}
