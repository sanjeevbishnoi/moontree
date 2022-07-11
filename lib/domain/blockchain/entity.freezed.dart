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
mixin _$Blockchain {
  Protocol get protocol => throw _privateConstructorUsedError;
  List<Wallet> get wallets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockchainCopyWith<Blockchain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainCopyWith<$Res> {
  factory $BlockchainCopyWith(
          Blockchain value, $Res Function(Blockchain) then) =
      _$BlockchainCopyWithImpl<$Res>;
  $Res call({Protocol protocol, List<Wallet> wallets});
}

/// @nodoc
class _$BlockchainCopyWithImpl<$Res> implements $BlockchainCopyWith<$Res> {
  _$BlockchainCopyWithImpl(this._value, this._then);

  final Blockchain _value;
  // ignore: unused_field
  final $Res Function(Blockchain) _then;

  @override
  $Res call({
    Object? protocol = freezed,
    Object? wallets = freezed,
  }) {
    return _then(_value.copyWith(
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as Protocol,
      wallets: wallets == freezed
          ? _value.wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
    ));
  }
}

/// @nodoc
abstract class _$$_BlockchainCopyWith<$Res>
    implements $BlockchainCopyWith<$Res> {
  factory _$$_BlockchainCopyWith(
          _$_Blockchain value, $Res Function(_$_Blockchain) then) =
      __$$_BlockchainCopyWithImpl<$Res>;
  @override
  $Res call({Protocol protocol, List<Wallet> wallets});
}

/// @nodoc
class __$$_BlockchainCopyWithImpl<$Res> extends _$BlockchainCopyWithImpl<$Res>
    implements _$$_BlockchainCopyWith<$Res> {
  __$$_BlockchainCopyWithImpl(
      _$_Blockchain _value, $Res Function(_$_Blockchain) _then)
      : super(_value, (v) => _then(v as _$_Blockchain));

  @override
  _$_Blockchain get _value => super._value as _$_Blockchain;

  @override
  $Res call({
    Object? protocol = freezed,
    Object? wallets = freezed,
  }) {
    return _then(_$_Blockchain(
      protocol: protocol == freezed
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as Protocol,
      wallets: wallets == freezed
          ? _value._wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<Wallet>,
    ));
  }
}

/// @nodoc

class _$_Blockchain implements _Blockchain {
  const _$_Blockchain(
      {required this.protocol, required final List<Wallet> wallets})
      : _wallets = wallets;

  @override
  final Protocol protocol;
  final List<Wallet> _wallets;
  @override
  List<Wallet> get wallets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallets);
  }

  @override
  String toString() {
    return 'Blockchain(protocol: $protocol, wallets: $wallets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Blockchain &&
            const DeepCollectionEquality().equals(other.protocol, protocol) &&
            const DeepCollectionEquality().equals(other._wallets, _wallets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(protocol),
      const DeepCollectionEquality().hash(_wallets));

  @JsonKey(ignore: true)
  @override
  _$$_BlockchainCopyWith<_$_Blockchain> get copyWith =>
      __$$_BlockchainCopyWithImpl<_$_Blockchain>(this, _$identity);
}

abstract class _Blockchain implements Blockchain {
  const factory _Blockchain(
      {required final Protocol protocol,
      required final List<Wallet> wallets}) = _$_Blockchain;

  @override
  Protocol get protocol;
  @override
  List<Wallet> get wallets;
  @override
  @JsonKey(ignore: true)
  _$$_BlockchainCopyWith<_$_Blockchain> get copyWith =>
      throw _privateConstructorUsedError;
}
