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
mixin _$Wallet {
  WalletName get name => throw _privateConstructorUsedError;
  HashedEntropy get hashedEntropy => throw _privateConstructorUsedError;
  PrivKey get privKey => throw _privateConstructorUsedError;
  PubKey get pubKey => throw _privateConstructorUsedError;
  PubKeyAddress get receiveAddress => throw _privateConstructorUsedError;
  List<Holding> get holdings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletCopyWith<Wallet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCopyWith<$Res> {
  factory $WalletCopyWith(Wallet value, $Res Function(Wallet) then) =
      _$WalletCopyWithImpl<$Res>;
  $Res call(
      {WalletName name,
      HashedEntropy hashedEntropy,
      PrivKey privKey,
      PubKey pubKey,
      PubKeyAddress receiveAddress,
      List<Holding> holdings});
}

/// @nodoc
class _$WalletCopyWithImpl<$Res> implements $WalletCopyWith<$Res> {
  _$WalletCopyWithImpl(this._value, this._then);

  final Wallet _value;
  // ignore: unused_field
  final $Res Function(Wallet) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? hashedEntropy = freezed,
    Object? privKey = freezed,
    Object? pubKey = freezed,
    Object? receiveAddress = freezed,
    Object? holdings = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as WalletName,
      hashedEntropy: hashedEntropy == freezed
          ? _value.hashedEntropy
          : hashedEntropy // ignore: cast_nullable_to_non_nullable
              as HashedEntropy,
      privKey: privKey == freezed
          ? _value.privKey
          : privKey // ignore: cast_nullable_to_non_nullable
              as PrivKey,
      pubKey: pubKey == freezed
          ? _value.pubKey
          : pubKey // ignore: cast_nullable_to_non_nullable
              as PubKey,
      receiveAddress: receiveAddress == freezed
          ? _value.receiveAddress
          : receiveAddress // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      holdings: holdings == freezed
          ? _value.holdings
          : holdings // ignore: cast_nullable_to_non_nullable
              as List<Holding>,
    ));
  }
}

/// @nodoc
abstract class _$$_WalletCopyWith<$Res> implements $WalletCopyWith<$Res> {
  factory _$$_WalletCopyWith(_$_Wallet value, $Res Function(_$_Wallet) then) =
      __$$_WalletCopyWithImpl<$Res>;
  @override
  $Res call(
      {WalletName name,
      HashedEntropy hashedEntropy,
      PrivKey privKey,
      PubKey pubKey,
      PubKeyAddress receiveAddress,
      List<Holding> holdings});
}

/// @nodoc
class __$$_WalletCopyWithImpl<$Res> extends _$WalletCopyWithImpl<$Res>
    implements _$$_WalletCopyWith<$Res> {
  __$$_WalletCopyWithImpl(_$_Wallet _value, $Res Function(_$_Wallet) _then)
      : super(_value, (v) => _then(v as _$_Wallet));

  @override
  _$_Wallet get _value => super._value as _$_Wallet;

  @override
  $Res call({
    Object? name = freezed,
    Object? hashedEntropy = freezed,
    Object? privKey = freezed,
    Object? pubKey = freezed,
    Object? receiveAddress = freezed,
    Object? holdings = freezed,
  }) {
    return _then(_$_Wallet(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as WalletName,
      hashedEntropy: hashedEntropy == freezed
          ? _value.hashedEntropy
          : hashedEntropy // ignore: cast_nullable_to_non_nullable
              as HashedEntropy,
      privKey: privKey == freezed
          ? _value.privKey
          : privKey // ignore: cast_nullable_to_non_nullable
              as PrivKey,
      pubKey: pubKey == freezed
          ? _value.pubKey
          : pubKey // ignore: cast_nullable_to_non_nullable
              as PubKey,
      receiveAddress: receiveAddress == freezed
          ? _value.receiveAddress
          : receiveAddress // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      holdings: holdings == freezed
          ? _value._holdings
          : holdings // ignore: cast_nullable_to_non_nullable
              as List<Holding>,
    ));
  }
}

/// @nodoc

class _$_Wallet implements _Wallet {
  const _$_Wallet(
      {required this.name,
      required this.hashedEntropy,
      required this.privKey,
      required this.pubKey,
      required this.receiveAddress,
      required final List<Holding> holdings})
      : _holdings = holdings;

  @override
  final WalletName name;
  @override
  final HashedEntropy hashedEntropy;
  @override
  final PrivKey privKey;
  @override
  final PubKey pubKey;
  @override
  final PubKeyAddress receiveAddress;
  final List<Holding> _holdings;
  @override
  List<Holding> get holdings {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_holdings);
  }

  @override
  String toString() {
    return 'Wallet(name: $name, hashedEntropy: $hashedEntropy, privKey: $privKey, pubKey: $pubKey, receiveAddress: $receiveAddress, holdings: $holdings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Wallet &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.hashedEntropy, hashedEntropy) &&
            const DeepCollectionEquality().equals(other.privKey, privKey) &&
            const DeepCollectionEquality().equals(other.pubKey, pubKey) &&
            const DeepCollectionEquality()
                .equals(other.receiveAddress, receiveAddress) &&
            const DeepCollectionEquality().equals(other._holdings, _holdings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(hashedEntropy),
      const DeepCollectionEquality().hash(privKey),
      const DeepCollectionEquality().hash(pubKey),
      const DeepCollectionEquality().hash(receiveAddress),
      const DeepCollectionEquality().hash(_holdings));

  @JsonKey(ignore: true)
  @override
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      __$$_WalletCopyWithImpl<_$_Wallet>(this, _$identity);
}

abstract class _Wallet implements Wallet {
  const factory _Wallet(
      {required final WalletName name,
      required final HashedEntropy hashedEntropy,
      required final PrivKey privKey,
      required final PubKey pubKey,
      required final PubKeyAddress receiveAddress,
      required final List<Holding> holdings}) = _$_Wallet;

  @override
  WalletName get name => throw _privateConstructorUsedError;
  @override
  HashedEntropy get hashedEntropy => throw _privateConstructorUsedError;
  @override
  PrivKey get privKey => throw _privateConstructorUsedError;
  @override
  PubKey get pubKey => throw _privateConstructorUsedError;
  @override
  PubKeyAddress get receiveAddress => throw _privateConstructorUsedError;
  @override
  List<Holding> get holdings => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WalletCopyWith<_$_Wallet> get copyWith =>
      throw _privateConstructorUsedError;
}
