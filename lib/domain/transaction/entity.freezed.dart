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
mixin _$Transaction {
  TxId get txId => throw _privateConstructorUsedError;
  TxType get type => throw _privateConstructorUsedError;
  SentReceived get sentReceived => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  TxConfirmations get confirmations => throw _privateConstructorUsedError;
  TxDate get date => throw _privateConstructorUsedError;
  TransactionDetail get transactionDetail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res>;
  $Res call(
      {TxId txId,
      TxType type,
      SentReceived sentReceived,
      Amount amount,
      TxConfirmations confirmations,
      TxDate date,
      TransactionDetail transactionDetail});

  $TransactionDetailCopyWith<$Res> get transactionDetail;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res> implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  final Transaction _value;
  // ignore: unused_field
  final $Res Function(Transaction) _then;

  @override
  $Res call({
    Object? txId = freezed,
    Object? type = freezed,
    Object? sentReceived = freezed,
    Object? amount = freezed,
    Object? confirmations = freezed,
    Object? date = freezed,
    Object? transactionDetail = freezed,
  }) {
    return _then(_value.copyWith(
      txId: txId == freezed
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as TxId,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TxType,
      sentReceived: sentReceived == freezed
          ? _value.sentReceived
          : sentReceived // ignore: cast_nullable_to_non_nullable
              as SentReceived,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      confirmations: confirmations == freezed
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as TxConfirmations,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as TxDate,
      transactionDetail: transactionDetail == freezed
          ? _value.transactionDetail
          : transactionDetail // ignore: cast_nullable_to_non_nullable
              as TransactionDetail,
    ));
  }

  @override
  $TransactionDetailCopyWith<$Res> get transactionDetail {
    return $TransactionDetailCopyWith<$Res>(_value.transactionDetail, (value) {
      return _then(_value.copyWith(transactionDetail: value));
    });
  }
}

/// @nodoc
abstract class _$$_TransactionCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$_TransactionCopyWith(
          _$_Transaction value, $Res Function(_$_Transaction) then) =
      __$$_TransactionCopyWithImpl<$Res>;
  @override
  $Res call(
      {TxId txId,
      TxType type,
      SentReceived sentReceived,
      Amount amount,
      TxConfirmations confirmations,
      TxDate date,
      TransactionDetail transactionDetail});

  @override
  $TransactionDetailCopyWith<$Res> get transactionDetail;
}

/// @nodoc
class __$$_TransactionCopyWithImpl<$Res> extends _$TransactionCopyWithImpl<$Res>
    implements _$$_TransactionCopyWith<$Res> {
  __$$_TransactionCopyWithImpl(
      _$_Transaction _value, $Res Function(_$_Transaction) _then)
      : super(_value, (v) => _then(v as _$_Transaction));

  @override
  _$_Transaction get _value => super._value as _$_Transaction;

  @override
  $Res call({
    Object? txId = freezed,
    Object? type = freezed,
    Object? sentReceived = freezed,
    Object? amount = freezed,
    Object? confirmations = freezed,
    Object? date = freezed,
    Object? transactionDetail = freezed,
  }) {
    return _then(_$_Transaction(
      txId: txId == freezed
          ? _value.txId
          : txId // ignore: cast_nullable_to_non_nullable
              as TxId,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TxType,
      sentReceived: sentReceived == freezed
          ? _value.sentReceived
          : sentReceived // ignore: cast_nullable_to_non_nullable
              as SentReceived,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      confirmations: confirmations == freezed
          ? _value.confirmations
          : confirmations // ignore: cast_nullable_to_non_nullable
              as TxConfirmations,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as TxDate,
      transactionDetail: transactionDetail == freezed
          ? _value.transactionDetail
          : transactionDetail // ignore: cast_nullable_to_non_nullable
              as TransactionDetail,
    ));
  }
}

/// @nodoc

class _$_Transaction implements _Transaction {
  const _$_Transaction(
      {required this.txId,
      required this.type,
      required this.sentReceived,
      required this.amount,
      required this.confirmations,
      required this.date,
      required this.transactionDetail});

  @override
  final TxId txId;
  @override
  final TxType type;
  @override
  final SentReceived sentReceived;
  @override
  final Amount amount;
  @override
  final TxConfirmations confirmations;
  @override
  final TxDate date;
  @override
  final TransactionDetail transactionDetail;

  @override
  String toString() {
    return 'Transaction(txId: $txId, type: $type, sentReceived: $sentReceived, amount: $amount, confirmations: $confirmations, date: $date, transactionDetail: $transactionDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transaction &&
            const DeepCollectionEquality().equals(other.txId, txId) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.sentReceived, sentReceived) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.confirmations, confirmations) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality()
                .equals(other.transactionDetail, transactionDetail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(txId),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(sentReceived),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(confirmations),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(transactionDetail));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      __$$_TransactionCopyWithImpl<_$_Transaction>(this, _$identity);
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {required final TxId txId,
      required final TxType type,
      required final SentReceived sentReceived,
      required final Amount amount,
      required final TxConfirmations confirmations,
      required final TxDate date,
      required final TransactionDetail transactionDetail}) = _$_Transaction;

  @override
  TxId get txId;
  @override
  TxType get type;
  @override
  SentReceived get sentReceived;
  @override
  Amount get amount;
  @override
  TxConfirmations get confirmations;
  @override
  TxDate get date;
  @override
  TransactionDetail get transactionDetail;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCopyWith<_$_Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}
