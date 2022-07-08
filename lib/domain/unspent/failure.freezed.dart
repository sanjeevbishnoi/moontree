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
mixin _$UnspentFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidUnspent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidUnspent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidUnspent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidUnspent value) invalidUnspent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidUnspent value)? invalidUnspent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidUnspent value)? invalidUnspent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnspentFailureCopyWith<$Res> {
  factory $UnspentFailureCopyWith(
          UnspentFailure value, $Res Function(UnspentFailure) then) =
      _$UnspentFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnspentFailureCopyWithImpl<$Res>
    implements $UnspentFailureCopyWith<$Res> {
  _$UnspentFailureCopyWithImpl(this._value, this._then);

  final UnspentFailure _value;
  // ignore: unused_field
  final $Res Function(UnspentFailure) _then;
}

/// @nodoc
abstract class _$$InvalidUnspentCopyWith<$Res> {
  factory _$$InvalidUnspentCopyWith(
          _$InvalidUnspent value, $Res Function(_$InvalidUnspent) then) =
      __$$InvalidUnspentCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidUnspentCopyWithImpl<$Res>
    extends _$UnspentFailureCopyWithImpl<$Res>
    implements _$$InvalidUnspentCopyWith<$Res> {
  __$$InvalidUnspentCopyWithImpl(
      _$InvalidUnspent _value, $Res Function(_$InvalidUnspent) _then)
      : super(_value, (v) => _then(v as _$InvalidUnspent));

  @override
  _$InvalidUnspent get _value => super._value as _$InvalidUnspent;
}

/// @nodoc

class _$InvalidUnspent implements InvalidUnspent {
  const _$InvalidUnspent();

  @override
  String toString() {
    return 'UnspentFailure.invalidUnspent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidUnspent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidUnspent,
  }) {
    return invalidUnspent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidUnspent,
  }) {
    return invalidUnspent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidUnspent,
    required TResult orElse(),
  }) {
    if (invalidUnspent != null) {
      return invalidUnspent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidUnspent value) invalidUnspent,
  }) {
    return invalidUnspent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidUnspent value)? invalidUnspent,
  }) {
    return invalidUnspent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidUnspent value)? invalidUnspent,
    required TResult orElse(),
  }) {
    if (invalidUnspent != null) {
      return invalidUnspent(this);
    }
    return orElse();
  }
}

abstract class InvalidUnspent implements UnspentFailure {
  const factory InvalidUnspent() = _$InvalidUnspent;
}
