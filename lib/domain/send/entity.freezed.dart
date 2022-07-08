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
mixin _$Send {
  Holding get holding => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  PubKeyAddress get address => throw _privateConstructorUsedError;
  PubKeyAddress get change => throw _privateConstructorUsedError;
  FeeSelection get feeSelection => throw _privateConstructorUsedError;
  Memo get memo => throw _privateConstructorUsedError;
  Note get note => throw _privateConstructorUsedError;
  bool get sendAll => throw _privateConstructorUsedError;
  List<Unspent> get assetUnspents => throw _privateConstructorUsedError;
  List<Unspent> get ravenUnspents => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendCopyWith<Send> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendCopyWith<$Res> {
  factory $SendCopyWith(Send value, $Res Function(Send) then) =
      _$SendCopyWithImpl<$Res>;
  $Res call(
      {Holding holding,
      Amount amount,
      PubKeyAddress address,
      PubKeyAddress change,
      FeeSelection feeSelection,
      Memo memo,
      Note note,
      bool sendAll,
      List<Unspent> assetUnspents,
      List<Unspent> ravenUnspents});

  $HoldingCopyWith<$Res> get holding;
}

/// @nodoc
class _$SendCopyWithImpl<$Res> implements $SendCopyWith<$Res> {
  _$SendCopyWithImpl(this._value, this._then);

  final Send _value;
  // ignore: unused_field
  final $Res Function(Send) _then;

  @override
  $Res call({
    Object? holding = freezed,
    Object? amount = freezed,
    Object? address = freezed,
    Object? change = freezed,
    Object? feeSelection = freezed,
    Object? memo = freezed,
    Object? note = freezed,
    Object? sendAll = freezed,
    Object? assetUnspents = freezed,
    Object? ravenUnspents = freezed,
  }) {
    return _then(_value.copyWith(
      holding: holding == freezed
          ? _value.holding
          : holding // ignore: cast_nullable_to_non_nullable
              as Holding,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      change: change == freezed
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      feeSelection: feeSelection == freezed
          ? _value.feeSelection
          : feeSelection // ignore: cast_nullable_to_non_nullable
              as FeeSelection,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Memo,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      sendAll: sendAll == freezed
          ? _value.sendAll
          : sendAll // ignore: cast_nullable_to_non_nullable
              as bool,
      assetUnspents: assetUnspents == freezed
          ? _value.assetUnspents
          : assetUnspents // ignore: cast_nullable_to_non_nullable
              as List<Unspent>,
      ravenUnspents: ravenUnspents == freezed
          ? _value.ravenUnspents
          : ravenUnspents // ignore: cast_nullable_to_non_nullable
              as List<Unspent>,
    ));
  }

  @override
  $HoldingCopyWith<$Res> get holding {
    return $HoldingCopyWith<$Res>(_value.holding, (value) {
      return _then(_value.copyWith(holding: value));
    });
  }
}

/// @nodoc
abstract class _$$_SendCopyWith<$Res> implements $SendCopyWith<$Res> {
  factory _$$_SendCopyWith(_$_Send value, $Res Function(_$_Send) then) =
      __$$_SendCopyWithImpl<$Res>;
  @override
  $Res call(
      {Holding holding,
      Amount amount,
      PubKeyAddress address,
      PubKeyAddress change,
      FeeSelection feeSelection,
      Memo memo,
      Note note,
      bool sendAll,
      List<Unspent> assetUnspents,
      List<Unspent> ravenUnspents});

  @override
  $HoldingCopyWith<$Res> get holding;
}

/// @nodoc
class __$$_SendCopyWithImpl<$Res> extends _$SendCopyWithImpl<$Res>
    implements _$$_SendCopyWith<$Res> {
  __$$_SendCopyWithImpl(_$_Send _value, $Res Function(_$_Send) _then)
      : super(_value, (v) => _then(v as _$_Send));

  @override
  _$_Send get _value => super._value as _$_Send;

  @override
  $Res call({
    Object? holding = freezed,
    Object? amount = freezed,
    Object? address = freezed,
    Object? change = freezed,
    Object? feeSelection = freezed,
    Object? memo = freezed,
    Object? note = freezed,
    Object? sendAll = freezed,
    Object? assetUnspents = freezed,
    Object? ravenUnspents = freezed,
  }) {
    return _then(_$_Send(
      holding: holding == freezed
          ? _value.holding
          : holding // ignore: cast_nullable_to_non_nullable
              as Holding,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      change: change == freezed
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      feeSelection: feeSelection == freezed
          ? _value.feeSelection
          : feeSelection // ignore: cast_nullable_to_non_nullable
              as FeeSelection,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as Memo,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      sendAll: sendAll == freezed
          ? _value.sendAll
          : sendAll // ignore: cast_nullable_to_non_nullable
              as bool,
      assetUnspents: assetUnspents == freezed
          ? _value._assetUnspents
          : assetUnspents // ignore: cast_nullable_to_non_nullable
              as List<Unspent>,
      ravenUnspents: ravenUnspents == freezed
          ? _value._ravenUnspents
          : ravenUnspents // ignore: cast_nullable_to_non_nullable
              as List<Unspent>,
    ));
  }
}

/// @nodoc

class _$_Send implements _Send {
  const _$_Send(
      {required this.holding,
      required this.amount,
      required this.address,
      required this.change,
      required this.feeSelection,
      required this.memo,
      required this.note,
      required this.sendAll,
      required final List<Unspent> assetUnspents,
      required final List<Unspent> ravenUnspents})
      : _assetUnspents = assetUnspents,
        _ravenUnspents = ravenUnspents;

  @override
  final Holding holding;
  @override
  final Amount amount;
  @override
  final PubKeyAddress address;
  @override
  final PubKeyAddress change;
  @override
  final FeeSelection feeSelection;
  @override
  final Memo memo;
  @override
  final Note note;
  @override
  final bool sendAll;
  final List<Unspent> _assetUnspents;
  @override
  List<Unspent> get assetUnspents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetUnspents);
  }

  final List<Unspent> _ravenUnspents;
  @override
  List<Unspent> get ravenUnspents {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ravenUnspents);
  }

  @override
  String toString() {
    return 'Send(holding: $holding, amount: $amount, address: $address, change: $change, feeSelection: $feeSelection, memo: $memo, note: $note, sendAll: $sendAll, assetUnspents: $assetUnspents, ravenUnspents: $ravenUnspents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Send &&
            const DeepCollectionEquality().equals(other.holding, holding) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.change, change) &&
            const DeepCollectionEquality()
                .equals(other.feeSelection, feeSelection) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.sendAll, sendAll) &&
            const DeepCollectionEquality()
                .equals(other._assetUnspents, _assetUnspents) &&
            const DeepCollectionEquality()
                .equals(other._ravenUnspents, _ravenUnspents));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(holding),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(change),
      const DeepCollectionEquality().hash(feeSelection),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(sendAll),
      const DeepCollectionEquality().hash(_assetUnspents),
      const DeepCollectionEquality().hash(_ravenUnspents));

  @JsonKey(ignore: true)
  @override
  _$$_SendCopyWith<_$_Send> get copyWith =>
      __$$_SendCopyWithImpl<_$_Send>(this, _$identity);
}

abstract class _Send implements Send {
  const factory _Send(
      {required final Holding holding,
      required final Amount amount,
      required final PubKeyAddress address,
      required final PubKeyAddress change,
      required final FeeSelection feeSelection,
      required final Memo memo,
      required final Note note,
      required final bool sendAll,
      required final List<Unspent> assetUnspents,
      required final List<Unspent> ravenUnspents}) = _$_Send;

  @override
  Holding get holding => throw _privateConstructorUsedError;
  @override
  Amount get amount => throw _privateConstructorUsedError;
  @override
  PubKeyAddress get address => throw _privateConstructorUsedError;
  @override
  PubKeyAddress get change => throw _privateConstructorUsedError;
  @override
  FeeSelection get feeSelection => throw _privateConstructorUsedError;
  @override
  Memo get memo => throw _privateConstructorUsedError;
  @override
  Note get note => throw _privateConstructorUsedError;
  @override
  bool get sendAll => throw _privateConstructorUsedError;
  @override
  List<Unspent> get assetUnspents => throw _privateConstructorUsedError;
  @override
  List<Unspent> get ravenUnspents => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SendCopyWith<_$_Send> get copyWith => throw _privateConstructorUsedError;
}
