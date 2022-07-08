// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddressFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidAddress value) invalidAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidAddress value)? invalidAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidAddress value)? invalidAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressFailureCopyWith<$Res> {
  factory $AddressFailureCopyWith(
          AddressFailure value, $Res Function(AddressFailure) then) =
      _$AddressFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddressFailureCopyWithImpl<$Res>
    implements $AddressFailureCopyWith<$Res> {
  _$AddressFailureCopyWithImpl(this._value, this._then);

  final AddressFailure _value;
  // ignore: unused_field
  final $Res Function(AddressFailure) _then;
}

/// @nodoc
abstract class _$$InvalidAddressCopyWith<$Res> {
  factory _$$InvalidAddressCopyWith(
          _$InvalidAddress value, $Res Function(_$InvalidAddress) then) =
      __$$InvalidAddressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidAddressCopyWithImpl<$Res>
    extends _$AddressFailureCopyWithImpl<$Res>
    implements _$$InvalidAddressCopyWith<$Res> {
  __$$InvalidAddressCopyWithImpl(
      _$InvalidAddress _value, $Res Function(_$InvalidAddress) _then)
      : super(_value, (v) => _then(v as _$InvalidAddress));

  @override
  _$InvalidAddress get _value => super._value as _$InvalidAddress;
}

/// @nodoc

class _$InvalidAddress implements InvalidAddress {
  const _$InvalidAddress();

  @override
  String toString() {
    return 'AddressFailure.invalidAddress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidAddress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidAddress,
  }) {
    return invalidAddress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidAddress,
  }) {
    return invalidAddress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidAddress,
    required TResult orElse(),
  }) {
    if (invalidAddress != null) {
      return invalidAddress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidAddress value) invalidAddress,
  }) {
    return invalidAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidAddress value)? invalidAddress,
  }) {
    return invalidAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidAddress value)? invalidAddress,
    required TResult orElse(),
  }) {
    if (invalidAddress != null) {
      return invalidAddress(this);
    }
    return orElse();
  }
}

abstract class InvalidAddress implements AddressFailure {
  const factory InvalidAddress() = _$InvalidAddress;
}
