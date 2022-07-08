// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Unspent {
  TxId get txId => throw _privateConstructorUsedError;
  TxPosition get position => throw _privateConstructorUsedError;
  PubKeyAddress get toAddress => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  LockingScript get lockingScript => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnspentCopyWith<Unspent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnspentCopyWith<$Res> {
  factory $UnspentCopyWith(Unspent value, $Res Function(Unspent) then) =
      _$UnspentCopyWithImpl<$Res>;
  $Res call(
      {TxId txId,
      TxPosition position,
      PubKeyAddress toAddress,
      Amount amount,
      LockingScript lockingScript});
}

/// @nodoc
class _$UnspentCopyWithImpl<$Res> implements $UnspentCopyWith<$Res> {
  _$UnspentCopyWithImpl(this._value, this._then);

  final Unspent _value;
  // ignore: unused_field
  final $Res Function(Unspent) _then;

  @override
  $Res call({
    Object? txId = freezed,
    Object? position = freezed,
    Object? toAddress = freezed,
    Object? amount = freezed,
    Object? lockingScript = freezed,
  }) {
    return _then(_value.copyWith(
      txId: txId == freezed
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as TxId,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as TxPosition,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      lockingScript: lockingScript == freezed
          ? _value.lockingScript
          : lockingScript // ignore: cast_nullable_to_non_nullable
              as LockingScript,
    ));
  }
}

/// @nodoc
abstract class _$$_UnspentCopyWith<$Res> implements $UnspentCopyWith<$Res> {
  factory _$$_UnspentCopyWith(
          _$_Unspent value, $Res Function(_$_Unspent) then) =
      __$$_UnspentCopyWithImpl<$Res>;
  @override
  $Res call(
      {TxId txId,
      TxPosition position,
      PubKeyAddress toAddress,
      Amount amount,
      LockingScript lockingScript});
}

/// @nodoc
class __$$_UnspentCopyWithImpl<$Res> extends _$UnspentCopyWithImpl<$Res>
    implements _$$_UnspentCopyWith<$Res> {
  __$$_UnspentCopyWithImpl(_$_Unspent _value, $Res Function(_$_Unspent) _then)
      : super(_value, (v) => _then(v as _$_Unspent));

  @override
  _$_Unspent get _value => super._value as _$_Unspent;

  @override
  $Res call({
    Object? txId = freezed,
    Object? position = freezed,
    Object? toAddress = freezed,
    Object? amount = freezed,
    Object? lockingScript = freezed,
  }) {
    return _then(_$_Unspent(
      txId: txId == freezed
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as TxId,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as TxPosition,
      toAddress: toAddress == freezed
          ? _value.toAddress
          : toAddress // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      lockingScript: lockingScript == freezed
          ? _value.lockingScript
          : lockingScript // ignore: cast_nullable_to_non_nullable
              as LockingScript,
    ));
  }
}

/// @nodoc

class _$_Unspent implements _Unspent {
  const _$_Unspent(
      {required this.txId,
      required this.position,
      required this.toAddress,
      required this.amount,
      required this.lockingScript});

  @override
  final TxId txId;
  @override
  final TxPosition position;
  @override
  final PubKeyAddress toAddress;
  @override
  final Amount amount;
  @override
  final LockingScript lockingScript;

  @override
  String toString() {
    return 'Unspent(txId: $txId, position: $position, toAddress: $toAddress, amount: $amount, lockingScript: $lockingScript)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unspent &&
            const DeepCollectionEquality().equals(other.txId, txId) &&
            const DeepCollectionEquality().equals(other.position, position) &&
            const DeepCollectionEquality().equals(other.toAddress, toAddress) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.lockingScript, lockingScript));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(txId),
      const DeepCollectionEquality().hash(position),
      const DeepCollectionEquality().hash(toAddress),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(lockingScript));

  @JsonKey(ignore: true)
  @override
  _$$_UnspentCopyWith<_$_Unspent> get copyWith =>
      __$$_UnspentCopyWithImpl<_$_Unspent>(this, _$identity);
}

abstract class _Unspent implements Unspent {
  const factory _Unspent(
      {required final TxId txId,
      required final TxPosition position,
      required final PubKeyAddress toAddress,
      required final Amount amount,
      required final LockingScript lockingScript}) = _$_Unspent;

  @override
  TxId get txId => throw _privateConstructorUsedError;
  @override
  TxPosition get position => throw _privateConstructorUsedError;
  @override
  PubKeyAddress get toAddress => throw _privateConstructorUsedError;
  @override
  Amount get amount => throw _privateConstructorUsedError;
  @override
  LockingScript get lockingScript => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UnspentCopyWith<_$_Unspent> get copyWith =>
      throw _privateConstructorUsedError;
}
