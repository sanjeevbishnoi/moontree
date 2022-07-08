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
mixin _$UnsignedTransaction {
  bool get signed => throw _privateConstructorUsedError;
  Amount get fee => throw _privateConstructorUsedError;
  TxHash get txHash => throw _privateConstructorUsedError;
  dynamic get txBuilder => throw _privateConstructorUsedError;
  dynamic get tx => throw _privateConstructorUsedError;
  List<Unspent> get chosenUnspents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UnsignedTransactionCopyWith<UnsignedTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnsignedTransactionCopyWith<$Res> {
  factory $UnsignedTransactionCopyWith(
          UnsignedTransaction value, $Res Function(UnsignedTransaction) then) =
      _$UnsignedTransactionCopyWithImpl<$Res>;
  $Res call(
      {bool signed,
      Amount fee,
      TxHash txHash,
      dynamic txBuilder,
      dynamic tx,
      List<Unspent> chosenUnspents});
}

/// @nodoc
class _$UnsignedTransactionCopyWithImpl<$Res>
    implements $UnsignedTransactionCopyWith<$Res> {
  _$UnsignedTransactionCopyWithImpl(this._value, this._then);

  final UnsignedTransaction _value;
  // ignore: unused_field
  final $Res Function(UnsignedTransaction) _then;

  @override
  $Res call({
    Object? signed = freezed,
    Object? fee = freezed,
    Object? txHash = freezed,
    Object? txBuilder = freezed,
    Object? tx = freezed,
    Object? chosenUnspents = freezed,
  }) {
    return _then(_value.copyWith(
      signed: signed == freezed
          ? _value.signed
          : signed // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as Amount,
      txHash: txHash == freezed
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as TxHash,
      txBuilder: txBuilder == freezed
          ? _value.txBuilder
          : txBuilder // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tx: tx == freezed
          ? _value.tx
          : tx // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chosenUnspents: chosenUnspents == freezed
          ? _value.chosenUnspents
          : chosenUnspents // ignore: cast_nullable_to_non_nullable
              as List<Unspent>,
    ));
  }
}

/// @nodoc
abstract class _$$_UnsignedTransactionCopyWith<$Res>
    implements $UnsignedTransactionCopyWith<$Res> {
  factory _$$_UnsignedTransactionCopyWith(_$_UnsignedTransaction value,
          $Res Function(_$_UnsignedTransaction) then) =
      __$$_UnsignedTransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool signed,
      Amount fee,
      TxHash txHash,
      dynamic txBuilder,
      dynamic tx,
      List<Unspent> chosenUnspents});
}

/// @nodoc
class __$$_UnsignedTransactionCopyWithImpl<$Res>
    extends _$UnsignedTransactionCopyWithImpl<$Res>
    implements _$$_UnsignedTransactionCopyWith<$Res> {
  __$$_UnsignedTransactionCopyWithImpl(_$_UnsignedTransaction _value,
      $Res Function(_$_UnsignedTransaction) _then)
      : super(_value, (v) => _then(v as _$_UnsignedTransaction));

  @override
  _$_UnsignedTransaction get _value => super._value as _$_UnsignedTransaction;

  @override
  $Res call({
    Object? signed = freezed,
    Object? fee = freezed,
    Object? txHash = freezed,
    Object? txBuilder = freezed,
    Object? tx = freezed,
    Object? chosenUnspents = freezed,
  }) {
    return _then(_$_UnsignedTransaction(
      signed: signed == freezed
          ? _value.signed
          : signed // ignore: cast_nullable_to_non_nullable
              as bool,
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as Amount,
      txHash: txHash == freezed
          ? _value.txHash
          : txHash // ignore: cast_nullable_to_non_nullable
              as TxHash,
      txBuilder: txBuilder == freezed
          ? _value.txBuilder
          : txBuilder // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tx: tx == freezed
          ? _value.tx
          : tx // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chosenUnspents: chosenUnspents == freezed
          ? _value._chosenUnspents
          : chosenUnspents // ignore: cast_nullable_to_non_nullable
              as List<Unspent>,
    ));
  }
}

/// @nodoc

class _$_UnsignedTransaction implements _UnsignedTransaction {
  const _$_UnsignedTransaction(
      {required this.signed,
      required this.fee,
      required this.txHash,
      required this.txBuilder,
      required this.tx,
      required final List<Unspent> chosenUnspents})
      : _chosenUnspents = chosenUnspents;

  @override
  final bool signed;
  @override
  final Amount fee;
  @override
  final TxHash txHash;
  @override
  final dynamic txBuilder;
  @override
  final dynamic tx;
  final List<Unspent> _chosenUnspents;
  @override
  List<Unspent> get chosenUnspents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chosenUnspents);
  }

  @override
  String toString() {
    return 'UnsignedTransaction(signed: $signed, fee: $fee, txHash: $txHash, txBuilder: $txBuilder, tx: $tx, chosenUnspents: $chosenUnspents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnsignedTransaction &&
            const DeepCollectionEquality().equals(other.signed, signed) &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality().equals(other.txHash, txHash) &&
            const DeepCollectionEquality().equals(other.txBuilder, txBuilder) &&
            const DeepCollectionEquality().equals(other.tx, tx) &&
            const DeepCollectionEquality()
                .equals(other._chosenUnspents, _chosenUnspents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(signed),
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(txHash),
      const DeepCollectionEquality().hash(txBuilder),
      const DeepCollectionEquality().hash(tx),
      const DeepCollectionEquality().hash(_chosenUnspents));

  @JsonKey(ignore: true)
  @override
  _$$_UnsignedTransactionCopyWith<_$_UnsignedTransaction> get copyWith =>
      __$$_UnsignedTransactionCopyWithImpl<_$_UnsignedTransaction>(
          this, _$identity);
}

abstract class _UnsignedTransaction implements UnsignedTransaction {
  const factory _UnsignedTransaction(
      {required final bool signed,
      required final Amount fee,
      required final TxHash txHash,
      required final dynamic txBuilder,
      required final dynamic tx,
      required final List<Unspent> chosenUnspents}) = _$_UnsignedTransaction;

  @override
  bool get signed => throw _privateConstructorUsedError;
  @override
  Amount get fee => throw _privateConstructorUsedError;
  @override
  TxHash get txHash => throw _privateConstructorUsedError;
  @override
  dynamic get txBuilder => throw _privateConstructorUsedError;
  @override
  dynamic get tx => throw _privateConstructorUsedError;
  @override
  List<Unspent> get chosenUnspents => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UnsignedTransactionCopyWith<_$_UnsignedTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
