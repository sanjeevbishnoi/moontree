import 'package:dartz/dartz.dart';
import 'package:wallet_utils/wallet_utils.dart' show Derivation;
import 'package:moontree/domain/core/value_object.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/domain/address/validators.dart';

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

class DerivationPath extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const DerivationPath._(this.value);

  factory DerivationPath(String key) =>
      DerivationPath._(validateDerivationPath(key));
  factory DerivationPath.empty() => DerivationPath('');

  List<String> _splitPath() => getOrCrash().replaceAll("'", '').split('/');

  String get dSchemeLetter => _splitPath()[0];
  String get networkNumber => _splitPath()[1];
  String get mainnetNumber => _splitPath()[2];
  String get accountNumber => _splitPath()[3];
  String get receiveNumber => _splitPath()[4];
  String get hdIndexNumber => _splitPath()[5];

  bool get isReceive => receiveNumber == Derivation.receiveNumber();
  bool get isMainnet => mainnetNumber == Derivation.mainnetNumber();
  bool get isRavencoin => networkNumber == Derivation.ravencoinNumber;
  int get index => int.parse(hdIndexNumber);
}
