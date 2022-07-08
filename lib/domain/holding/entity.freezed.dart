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
mixin _$Holding {
  FullName get fullName => throw _privateConstructorUsedError;
  AssetType get assetType => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;
  Amount get amount => throw _privateConstructorUsedError;
  List<Transaction> get transactions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HoldingCopyWith<Holding> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoldingCopyWith<$Res> {
  factory $HoldingCopyWith(Holding value, $Res Function(Holding) then) =
      _$HoldingCopyWithImpl<$Res>;
  $Res call(
      {FullName fullName,
      AssetType assetType,
      Name name,
      Amount amount,
      List<Transaction> transactions});
}

/// @nodoc
class _$HoldingCopyWithImpl<$Res> implements $HoldingCopyWith<$Res> {
  _$HoldingCopyWithImpl(this._value, this._then);

  final Holding _value;
  // ignore: unused_field
  final $Res Function(Holding) _then;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? assetType = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      assetType: assetType == freezed
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      transactions: transactions == freezed
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc
abstract class _$$_HoldingCopyWith<$Res> implements $HoldingCopyWith<$Res> {
  factory _$$_HoldingCopyWith(
          _$_Holding value, $Res Function(_$_Holding) then) =
      __$$_HoldingCopyWithImpl<$Res>;
  @override
  $Res call(
      {FullName fullName,
      AssetType assetType,
      Name name,
      Amount amount,
      List<Transaction> transactions});
}

/// @nodoc
class __$$_HoldingCopyWithImpl<$Res> extends _$HoldingCopyWithImpl<$Res>
    implements _$$_HoldingCopyWith<$Res> {
  __$$_HoldingCopyWithImpl(_$_Holding _value, $Res Function(_$_Holding) _then)
      : super(_value, (v) => _then(v as _$_Holding));

  @override
  _$_Holding get _value => super._value as _$_Holding;

  @override
  $Res call({
    Object? fullName = freezed,
    Object? assetType = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? transactions = freezed,
  }) {
    return _then(_$_Holding(
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as FullName,
      assetType: assetType == freezed
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      transactions: transactions == freezed
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

class _$_Holding implements _Holding {
  const _$_Holding(
      {required this.fullName,
      required this.assetType,
      required this.name,
      required this.amount,
      required final List<Transaction> transactions})
      : _transactions = transactions;

  @override
  final FullName fullName;
  @override
  final AssetType assetType;
  @override
  final Name name;
  @override
  final Amount amount;
  final List<Transaction> _transactions;
  @override
  List<Transaction> get transactions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'Holding(fullName: $fullName, assetType: $assetType, name: $name, amount: $amount, transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Holding &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality().equals(other.assetType, assetType) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(assetType),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  _$$_HoldingCopyWith<_$_Holding> get copyWith =>
      __$$_HoldingCopyWithImpl<_$_Holding>(this, _$identity);
}

abstract class _Holding implements Holding {
  const factory _Holding(
      {required final FullName fullName,
      required final AssetType assetType,
      required final Name name,
      required final Amount amount,
      required final List<Transaction> transactions}) = _$_Holding;

  @override
  FullName get fullName => throw _privateConstructorUsedError;
  @override
  AssetType get assetType => throw _privateConstructorUsedError;
  @override
  Name get name => throw _privateConstructorUsedError;
  @override
  Amount get amount => throw _privateConstructorUsedError;
  @override
  List<Transaction> get transactions => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_HoldingCopyWith<_$_Holding> get copyWith =>
      throw _privateConstructorUsedError;
}
