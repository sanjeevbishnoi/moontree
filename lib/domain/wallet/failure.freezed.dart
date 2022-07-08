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
mixin _$WalletFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidWallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidWallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidWallet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidWallet value) invalidWallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidWallet value)? invalidWallet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidWallet value)? invalidWallet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletFailureCopyWith<$Res> {
  factory $WalletFailureCopyWith(
          WalletFailure value, $Res Function(WalletFailure) then) =
      _$WalletFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$WalletFailureCopyWithImpl<$Res>
    implements $WalletFailureCopyWith<$Res> {
  _$WalletFailureCopyWithImpl(this._value, this._then);

  final WalletFailure _value;
  // ignore: unused_field
  final $Res Function(WalletFailure) _then;
}

/// @nodoc
abstract class _$$InvalidWalletCopyWith<$Res> {
  factory _$$InvalidWalletCopyWith(
          _$InvalidWallet value, $Res Function(_$InvalidWallet) then) =
      __$$InvalidWalletCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidWalletCopyWithImpl<$Res>
    extends _$WalletFailureCopyWithImpl<$Res>
    implements _$$InvalidWalletCopyWith<$Res> {
  __$$InvalidWalletCopyWithImpl(
      _$InvalidWallet _value, $Res Function(_$InvalidWallet) _then)
      : super(_value, (v) => _then(v as _$InvalidWallet));

  @override
  _$InvalidWallet get _value => super._value as _$InvalidWallet;
}

/// @nodoc

class _$InvalidWallet implements InvalidWallet {
  const _$InvalidWallet();

  @override
  String toString() {
    return 'WalletFailure.invalidWallet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidWallet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidWallet,
  }) {
    return invalidWallet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidWallet,
  }) {
    return invalidWallet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidWallet,
    required TResult orElse(),
  }) {
    if (invalidWallet != null) {
      return invalidWallet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidWallet value) invalidWallet,
  }) {
    return invalidWallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidWallet value)? invalidWallet,
  }) {
    return invalidWallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidWallet value)? invalidWallet,
    required TResult orElse(),
  }) {
    if (invalidWallet != null) {
      return invalidWallet(this);
    }
    return orElse();
  }
}

abstract class InvalidWallet implements WalletFailure {
  const factory InvalidWallet() = _$InvalidWallet;
}
