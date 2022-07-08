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
mixin _$TransactionDetailFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidTransactionDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidTransactionDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidTransactionDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransactionDetail value)
        invalidTransactionDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidTransactionDetail value)? invalidTransactionDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransactionDetail value)? invalidTransactionDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDetailFailureCopyWith<$Res> {
  factory $TransactionDetailFailureCopyWith(TransactionDetailFailure value,
          $Res Function(TransactionDetailFailure) then) =
      _$TransactionDetailFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionDetailFailureCopyWithImpl<$Res>
    implements $TransactionDetailFailureCopyWith<$Res> {
  _$TransactionDetailFailureCopyWithImpl(this._value, this._then);

  final TransactionDetailFailure _value;
  // ignore: unused_field
  final $Res Function(TransactionDetailFailure) _then;
}

/// @nodoc
abstract class _$$InvalidTransactionDetailCopyWith<$Res> {
  factory _$$InvalidTransactionDetailCopyWith(_$InvalidTransactionDetail value,
          $Res Function(_$InvalidTransactionDetail) then) =
      __$$InvalidTransactionDetailCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidTransactionDetailCopyWithImpl<$Res>
    extends _$TransactionDetailFailureCopyWithImpl<$Res>
    implements _$$InvalidTransactionDetailCopyWith<$Res> {
  __$$InvalidTransactionDetailCopyWithImpl(_$InvalidTransactionDetail _value,
      $Res Function(_$InvalidTransactionDetail) _then)
      : super(_value, (v) => _then(v as _$InvalidTransactionDetail));

  @override
  _$InvalidTransactionDetail get _value =>
      super._value as _$InvalidTransactionDetail;
}

/// @nodoc

class _$InvalidTransactionDetail implements InvalidTransactionDetail {
  const _$InvalidTransactionDetail();

  @override
  String toString() {
    return 'TransactionDetailFailure.invalidTransactionDetail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidTransactionDetail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidTransactionDetail,
  }) {
    return invalidTransactionDetail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? invalidTransactionDetail,
  }) {
    return invalidTransactionDetail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidTransactionDetail,
    required TResult orElse(),
  }) {
    if (invalidTransactionDetail != null) {
      return invalidTransactionDetail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransactionDetail value)
        invalidTransactionDetail,
  }) {
    return invalidTransactionDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidTransactionDetail value)? invalidTransactionDetail,
  }) {
    return invalidTransactionDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransactionDetail value)? invalidTransactionDetail,
    required TResult orElse(),
  }) {
    if (invalidTransactionDetail != null) {
      return invalidTransactionDetail(this);
    }
    return orElse();
  }
}

abstract class InvalidTransactionDetail implements TransactionDetailFailure {
  const factory InvalidTransactionDetail() = _$InvalidTransactionDetail;
}
