import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/value_object.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/domain/holding/validators.dart';

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
  factory Name.fromFullName(String name) => Name(_fromFullName(name));
  factory Name.empty() => Name('');
  static String _fromFullName(String name) => name.split('/').last;
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

AssetType assetTypeOf(String symbol) {
  if (symbol.startsWith('#') && symbol.contains('/')) {
    return AssetType.qualifier; //sub
  }
  if (symbol.startsWith('#')) {
    return AssetType.qualifier;
  }
  if (symbol.startsWith('\$')) {
    return AssetType.restricted;
  }
  if (symbol.contains('#')) {
    return AssetType.nft;
  }
  if (symbol.contains('~')) {
    return AssetType.channel;
  }
  if (symbol.endsWith('!') && symbol.contains('/')) {
    return AssetType.admin; //sub
  }
  if (symbol.contains('/')) {
    return AssetType.main; //sub
  }
  if (symbol.endsWith('!')) {
    return AssetType.admin;
  }
  if (symbol == 'RVN') {
    return AssetType.currency;
  }
  if (boolValidateFullName(symbol)) {
    return AssetType.main;
  }
  return AssetType.unknown;
}

enum CoinType {
  unknown,
  ravencoin,
  evrmore,
}
