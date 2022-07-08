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
mixin _$SendFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidSend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidSend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidSend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidSend value) invalidSend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidSend value)? invalidSend,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidSend value)? invalidSend,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendFailureCopyWith<$Res> {
  factory $SendFailureCopyWith(
          SendFailure value, $Res Function(SendFailure) then) =
      _$SendFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendFailureCopyWithImpl<$Res> implements $SendFailureCopyWith<$Res> {
  _$SendFailureCopyWithImpl(this._value, this._then);

  final SendFailure _value;
  // ignore: unused_field
  final $Res Function(SendFailure) _then;
}

/// @nodoc
abstract class _$$InvalidSendCopyWith<$Res> {
  factory _$$InvalidSendCopyWith(
          _$InvalidSend value, $Res Function(_$InvalidSend) then) =
      __$$InvalidSendCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidSendCopyWithImpl<$Res> extends _$SendFailureCopyWithImpl<$Res>
    implements _$$InvalidSendCopyWith<$Res> {
  __$$InvalidSendCopyWithImpl(
      _$InvalidSend _value, $Res Function(_$InvalidSend) _then)
      : super(_value, (v) => _then(v as _$InvalidSend));

  @override
  _$InvalidSend get _value => super._value as _$InvalidSend;
}

/// @nodoc

class _$InvalidSend implements InvalidSend {
  const _$InvalidSend();

  @override
  String toString() {
    return 'SendFailure.invalidSend()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidSend);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidSend,
  }) {
    return invalidSend();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidSend,
  }) {
    return invalidSend?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidSend,
    required TResult orElse(),
  }) {
    if (invalidSend != null) {
      return invalidSend();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidSend value) invalidSend,
  }) {
    return invalidSend(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidSend value)? invalidSend,
  }) {
    return invalidSend?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidSend value)? invalidSend,
    required TResult orElse(),
  }) {
    if (invalidSend != null) {
      return invalidSend(this);
    }
    return orElse();
  }
}

abstract class InvalidSend implements SendFailure {
  const factory InvalidSend() = _$InvalidSend;
}
