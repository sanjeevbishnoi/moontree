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
mixin _$BlockchainFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidBlockchain,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidBlockchain,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidBlockchain,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidBlockchain value) invalidBlockchain,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidBlockchain value)? invalidBlockchain,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidBlockchain value)? invalidBlockchain,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainFailureCopyWith<$Res> {
  factory $BlockchainFailureCopyWith(
          BlockchainFailure value, $Res Function(BlockchainFailure) then) =
      _$BlockchainFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$BlockchainFailureCopyWithImpl<$Res>
    implements $BlockchainFailureCopyWith<$Res> {
  _$BlockchainFailureCopyWithImpl(this._value, this._then);

  final BlockchainFailure _value;
  // ignore: unused_field
  final $Res Function(BlockchainFailure) _then;
}

/// @nodoc
abstract class _$$InvalidBlockchainCopyWith<$Res> {
  factory _$$InvalidBlockchainCopyWith(
          _$InvalidBlockchain value, $Res Function(_$InvalidBlockchain) then) =
      __$$InvalidBlockchainCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidBlockchainCopyWithImpl<$Res>
    extends _$BlockchainFailureCopyWithImpl<$Res>
    implements _$$InvalidBlockchainCopyWith<$Res> {
  __$$InvalidBlockchainCopyWithImpl(
      _$InvalidBlockchain _value, $Res Function(_$InvalidBlockchain) _then)
      : super(_value, (v) => _then(v as _$InvalidBlockchain));

  @override
  _$InvalidBlockchain get _value => super._value as _$InvalidBlockchain;
}

/// @nodoc

class _$InvalidBlockchain implements InvalidBlockchain {
  const _$InvalidBlockchain();

  @override
  String toString() {
    return 'BlockchainFailure.invalidBlockchain()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidBlockchain);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidBlockchain,
  }) {
    return invalidBlockchain();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidBlockchain,
  }) {
    return invalidBlockchain?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidBlockchain,
    required TResult orElse(),
  }) {
    if (invalidBlockchain != null) {
      return invalidBlockchain();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidBlockchain value) invalidBlockchain,
  }) {
    return invalidBlockchain(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidBlockchain value)? invalidBlockchain,
  }) {
    return invalidBlockchain?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidBlockchain value)? invalidBlockchain,
    required TResult orElse(),
  }) {
    if (invalidBlockchain != null) {
      return invalidBlockchain(this);
    }
    return orElse();
  }
}

abstract class InvalidBlockchain implements BlockchainFailure {
  const factory InvalidBlockchain() = _$InvalidBlockchain;
}
