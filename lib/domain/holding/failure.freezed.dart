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
mixin _$HoldingFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidHolding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidHolding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidHolding,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidHolding value) invalidHolding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidHolding value)? invalidHolding,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidHolding value)? invalidHolding,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoldingFailureCopyWith<$Res> {
  factory $HoldingFailureCopyWith(
          HoldingFailure value, $Res Function(HoldingFailure) then) =
      _$HoldingFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$HoldingFailureCopyWithImpl<$Res>
    implements $HoldingFailureCopyWith<$Res> {
  _$HoldingFailureCopyWithImpl(this._value, this._then);

  final HoldingFailure _value;
  // ignore: unused_field
  final $Res Function(HoldingFailure) _then;
}

/// @nodoc
abstract class _$$InvalidHoldingCopyWith<$Res> {
  factory _$$InvalidHoldingCopyWith(
          _$InvalidHolding value, $Res Function(_$InvalidHolding) then) =
      __$$InvalidHoldingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidHoldingCopyWithImpl<$Res>
    extends _$HoldingFailureCopyWithImpl<$Res>
    implements _$$InvalidHoldingCopyWith<$Res> {
  __$$InvalidHoldingCopyWithImpl(
      _$InvalidHolding _value, $Res Function(_$InvalidHolding) _then)
      : super(_value, (v) => _then(v as _$InvalidHolding));

  @override
  _$InvalidHolding get _value => super._value as _$InvalidHolding;
}

/// @nodoc

class _$InvalidHolding implements InvalidHolding {
  const _$InvalidHolding();

  @override
  String toString() {
    return 'HoldingFailure.invalidHolding()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidHolding);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidHolding,
  }) {
    return invalidHolding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidHolding,
  }) {
    return invalidHolding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidHolding,
    required TResult orElse(),
  }) {
    if (invalidHolding != null) {
      return invalidHolding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidHolding value) invalidHolding,
  }) {
    return invalidHolding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidHolding value)? invalidHolding,
  }) {
    return invalidHolding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidHolding value)? invalidHolding,
    required TResult orElse(),
  }) {
    if (invalidHolding != null) {
      return invalidHolding(this);
    }
    return orElse();
  }
}

abstract class InvalidHolding implements HoldingFailure {
  const factory InvalidHolding() = _$InvalidHolding;
}
