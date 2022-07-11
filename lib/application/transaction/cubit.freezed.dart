// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionCubitState {
  Either<TransactionFailure, Transaction> get transaction =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionCubitStateCopyWith<TransactionCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCubitStateCopyWith<$Res> {
  factory $TransactionCubitStateCopyWith(TransactionCubitState value,
          $Res Function(TransactionCubitState) then) =
      _$TransactionCubitStateCopyWithImpl<$Res>;
  $Res call(
      {Either<TransactionFailure, Transaction> transaction,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class _$TransactionCubitStateCopyWithImpl<$Res>
    implements $TransactionCubitStateCopyWith<$Res> {
  _$TransactionCubitStateCopyWithImpl(this._value, this._then);

  final TransactionCubitState _value;
  // ignore: unused_field
  final $Res Function(TransactionCubitState) _then;

  @override
  $Res call({
    Object? transaction = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      transaction: transaction == freezed
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Either<TransactionFailure, Transaction>,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TransactionCubitStateCopyWith<$Res>
    implements $TransactionCubitStateCopyWith<$Res> {
  factory _$$_TransactionCubitStateCopyWith(_$_TransactionCubitState value,
          $Res Function(_$_TransactionCubitState) then) =
      __$$_TransactionCubitStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Either<TransactionFailure, Transaction> transaction,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class __$$_TransactionCubitStateCopyWithImpl<$Res>
    extends _$TransactionCubitStateCopyWithImpl<$Res>
    implements _$$_TransactionCubitStateCopyWith<$Res> {
  __$$_TransactionCubitStateCopyWithImpl(_$_TransactionCubitState _value,
      $Res Function(_$_TransactionCubitState) _then)
      : super(_value, (v) => _then(v as _$_TransactionCubitState));

  @override
  _$_TransactionCubitState get _value =>
      super._value as _$_TransactionCubitState;

  @override
  $Res call({
    Object? transaction = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$_TransactionCubitState(
      transaction: transaction == freezed
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as Either<TransactionFailure, Transaction>,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TransactionCubitState implements _TransactionCubitState {
  const _$_TransactionCubitState(
      {required this.transaction,
      required this.showErrorMessages,
      required this.isSubmitting});

  @override
  final Either<TransactionFailure, Transaction> transaction;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'TransactionCubitState(transaction: $transaction, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionCubitState &&
            const DeepCollectionEquality()
                .equals(other.transaction, transaction) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(transaction),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionCubitStateCopyWith<_$_TransactionCubitState> get copyWith =>
      __$$_TransactionCubitStateCopyWithImpl<_$_TransactionCubitState>(
          this, _$identity);
}

abstract class _TransactionCubitState implements TransactionCubitState {
  const factory _TransactionCubitState(
      {required final Either<TransactionFailure, Transaction> transaction,
      required final bool showErrorMessages,
      required final bool isSubmitting}) = _$_TransactionCubitState;

  @override
  Either<TransactionFailure, Transaction> get transaction;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCubitStateCopyWith<_$_TransactionCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
