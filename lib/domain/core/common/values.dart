import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/errors.dart';
import 'package:moontree/domain/core/value_object.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/domain/core/common/validators.dart';

class Amount extends ValueObject<double> {
  static final int satsFactor = 10000000;

  @override
  final Either<ValueFailure<double>, double> value;

  const Amount._(this.value);

  factory Amount(double amount) => Amount._(validateAmount(amount));
  factory Amount.empty() => Amount(0);
  factory Amount.fromSats(int sats) =>
      Amount._(validateAmount(sats / satsFactor));

  int get asSats => value.fold(
        (l) => throw UnexpectedValueError(l),
        (r) => (r * satsFactor).toInt(),
      );
  String get leftOfDecimal => _filterOutZeros(0);
  String get rightOfDecimal => _filterOutZeros(1);

  String _filterOutZeros(int side) => value.fold(
        (l) => throw UnexpectedValueError(l),
        (r) {
          final x = r.toString().split('.')[side];
          return x == '0' ? '' : x;
        },
      );

  Amount operator +(Amount amount) =>
      Amount(value.getOrElse(() => 0) + amount.value.getOrElse(() => 0));
  Amount operator -(Amount amount) =>
      Amount(value.getOrElse(() => 0) - amount.value.getOrElse(() => 0));
  bool operator >=(Amount amount) =>
      value.getOrElse(() => -1) >= amount.value.getOrElse(() => 0);
  bool operator >(Amount amount) =>
      value.getOrElse(() => -1) > amount.value.getOrElse(() => 0);
  bool operator <=(Amount amount) =>
      value.getOrElse(() => -1) <= amount.value.getOrElse(() => 0);
  bool operator <(Amount amount) =>
      value.getOrElse(() => -1) < amount.value.getOrElse(() => 0);

  /// maybe do these operations on sats?
  //Amount operator *(Amount amount) =>
  //    Amount(value.getOrElse(() => 0) * amount.value.getOrElse(() => 0));
  //Amount operator /(Amount amount) =>
  //    Amount(value.getOrElse(() => 0) / amount.value.getOrElse(() => 0));

}

class Note extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Note._(this.value);

  factory Note(String note) => Note._(validateNote(note));
  factory Note.empty() => Note('');
}

class Memo extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const Memo._(this.value);

  factory Memo(String memo) => Memo._(validateMemo(memo));
  factory Memo.empty() => Memo('');
}

class TxPosition extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  const TxPosition._(this.value);

  factory TxPosition(int position) =>
      TxPosition._(validateTxPosition(position));
  factory TxPosition.empty() => TxPosition(0);
}

class TxId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TxId._(this.value);

  factory TxId(String txId) => TxId._(validateTxId(txId));
  factory TxId.empty() => TxId('');
}

class PubKeyAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const PubKeyAddress._(this.value);

  factory PubKeyAddress(String key, {bool mainnet = true}) =>
      PubKeyAddress._(validatePubKeyAddress(key, mainnet: mainnet));
  factory PubKeyAddress.empty() => PubKeyAddress('');
}
