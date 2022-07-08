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
mixin _$Address {
  PrivKey get privKey => throw _privateConstructorUsedError;
  PubKey get pubKey => throw _privateConstructorUsedError;
  PubKeyAddress get address => throw _privateConstructorUsedError;
  DerivationPath get derivationPath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {PrivKey privKey,
      PubKey pubKey,
      PubKeyAddress address,
      DerivationPath derivationPath});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object? privKey = freezed,
    Object? pubKey = freezed,
    Object? address = freezed,
    Object? derivationPath = freezed,
  }) {
    return _then(_value.copyWith(
      privKey: privKey == freezed
          ? _value.privKey
          : privKey // ignore: cast_nullable_to_non_nullable
              as PrivKey,
      pubKey: pubKey == freezed
          ? _value.pubKey
          : pubKey // ignore: cast_nullable_to_non_nullable
              as PubKey,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      derivationPath: derivationPath == freezed
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as DerivationPath,
    ));
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {PrivKey privKey,
      PubKey pubKey,
      PubKeyAddress address,
      DerivationPath derivationPath});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, (v) => _then(v as _$_Address));

  @override
  _$_Address get _value => super._value as _$_Address;

  @override
  $Res call({
    Object? privKey = freezed,
    Object? pubKey = freezed,
    Object? address = freezed,
    Object? derivationPath = freezed,
  }) {
    return _then(_$_Address(
      privKey: privKey == freezed
          ? _value.privKey
          : privKey // ignore: cast_nullable_to_non_nullable
              as PrivKey,
      pubKey: pubKey == freezed
          ? _value.pubKey
          : pubKey // ignore: cast_nullable_to_non_nullable
              as PubKey,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as PubKeyAddress,
      derivationPath: derivationPath == freezed
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as DerivationPath,
    ));
  }
}

/// @nodoc

class _$_Address implements _Address {
  const _$_Address(
      {required this.privKey,
      required this.pubKey,
      required this.address,
      required this.derivationPath});

  @override
  final PrivKey privKey;
  @override
  final PubKey pubKey;
  @override
  final PubKeyAddress address;
  @override
  final DerivationPath derivationPath;

  @override
  String toString() {
    return 'Address(privKey: $privKey, pubKey: $pubKey, address: $address, derivationPath: $derivationPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            const DeepCollectionEquality().equals(other.privKey, privKey) &&
            const DeepCollectionEquality().equals(other.pubKey, pubKey) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.derivationPath, derivationPath));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(privKey),
      const DeepCollectionEquality().hash(pubKey),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(derivationPath));

  @JsonKey(ignore: true)
  @override
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);
}

abstract class _Address implements Address {
  const factory _Address(
      {required final PrivKey privKey,
      required final PubKey pubKey,
      required final PubKeyAddress address,
      required final DerivationPath derivationPath}) = _$_Address;

  @override
  PrivKey get privKey => throw _privateConstructorUsedError;
  @override
  PubKey get pubKey => throw _privateConstructorUsedError;
  @override
  PubKeyAddress get address => throw _privateConstructorUsedError;
  @override
  DerivationPath get derivationPath => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
