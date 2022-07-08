import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/core/value_object.dart';
import 'package:moontree_layer_flutter/domain/core/value_failures.dart';
import 'package:moontree_layer_flutter/domain/holding/validators.dart';

class FullName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const FullName._(this.value);

  factory FullName(String fullName) => FullName._(validateFullName(fullName));
  factory FullName.empty() => FullName('');
}

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Name._(this.value);

  factory Name(String name) => Name._(validateFullName(name));
  factory Name.empty() => Name('');
}

enum AssetType {
  unknown,
  currency,
  main,
  admin,
  restricted,
  nft,
  channel,
  qualifier,
}

enum CoinType {
  unknown,
  ravencoin,
  evrmore,
}
