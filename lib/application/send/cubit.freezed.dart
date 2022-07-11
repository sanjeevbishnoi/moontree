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
mixin _$SendCubitState {
  Either<SendFailure, Send> get send => throw _privateConstructorUsedError;
  Either<UnsignedTransactionFailure, UnsignedTransaction>
      get unsignedTransaction => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendCubitStateCopyWith<SendCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendCubitStateCopyWith<$Res> {
  factory $SendCubitStateCopyWith(
          SendCubitState value, $Res Function(SendCubitState) then) =
      _$SendCubitStateCopyWithImpl<$Res>;
  $Res call(
      {Either<SendFailure, Send> send,
      Either<UnsignedTransactionFailure, UnsignedTransaction>
          unsignedTransaction,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class _$SendCubitStateCopyWithImpl<$Res>
    implements $SendCubitStateCopyWith<$Res> {
  _$SendCubitStateCopyWithImpl(this._value, this._then);

  final SendCubitState _value;
  // ignore: unused_field
  final $Res Function(SendCubitState) _then;

  @override
  $Res call({
    Object? send = freezed,
    Object? unsignedTransaction = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      send: send == freezed
          ? _value.send
          : send // ignore: cast_nullable_to_non_nullable
              as Either<SendFailure, Send>,
      unsignedTransaction: unsignedTransaction == freezed
          ? _value.unsignedTransaction
          : unsignedTransaction // ignore: cast_nullable_to_non_nullable
              as Either<UnsignedTransactionFailure, UnsignedTransaction>,
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
abstract class _$$_SendCubitStateCopyWith<$Res>
    implements $SendCubitStateCopyWith<$Res> {
  factory _$$_SendCubitStateCopyWith(
          _$_SendCubitState value, $Res Function(_$_SendCubitState) then) =
      __$$_SendCubitStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Either<SendFailure, Send> send,
      Either<UnsignedTransactionFailure, UnsignedTransaction>
          unsignedTransaction,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class __$$_SendCubitStateCopyWithImpl<$Res>
    extends _$SendCubitStateCopyWithImpl<$Res>
    implements _$$_SendCubitStateCopyWith<$Res> {
  __$$_SendCubitStateCopyWithImpl(
      _$_SendCubitState _value, $Res Function(_$_SendCubitState) _then)
      : super(_value, (v) => _then(v as _$_SendCubitState));

  @override
  _$_SendCubitState get _value => super._value as _$_SendCubitState;

  @override
  $Res call({
    Object? send = freezed,
    Object? unsignedTransaction = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$_SendCubitState(
      send: send == freezed
          ? _value.send
          : send // ignore: cast_nullable_to_non_nullable
              as Either<SendFailure, Send>,
      unsignedTransaction: unsignedTransaction == freezed
          ? _value.unsignedTransaction
          : unsignedTransaction // ignore: cast_nullable_to_non_nullable
              as Either<UnsignedTransactionFailure, UnsignedTransaction>,
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

class _$_SendCubitState implements _SendCubitState {
  const _$_SendCubitState(
      {required this.send,
      required this.unsignedTransaction,
      required this.showErrorMessages,
      required this.isSubmitting});

  @override
  final Either<SendFailure, Send> send;
  @override
  final Either<UnsignedTransactionFailure, UnsignedTransaction>
      unsignedTransaction;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'SendCubitState(send: $send, unsignedTransaction: $unsignedTransaction, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendCubitState &&
            const DeepCollectionEquality().equals(other.send, send) &&
            const DeepCollectionEquality()
                .equals(other.unsignedTransaction, unsignedTransaction) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(send),
      const DeepCollectionEquality().hash(unsignedTransaction),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting));

  @JsonKey(ignore: true)
  @override
  _$$_SendCubitStateCopyWith<_$_SendCubitState> get copyWith =>
      __$$_SendCubitStateCopyWithImpl<_$_SendCubitState>(this, _$identity);
}

abstract class _SendCubitState implements SendCubitState {
  const factory _SendCubitState(
      {required final Either<SendFailure, Send> send,
      required final Either<UnsignedTransactionFailure, UnsignedTransaction>
          unsignedTransaction,
      required final bool showErrorMessages,
      required final bool isSubmitting}) = _$_SendCubitState;

  @override
  Either<SendFailure, Send> get send;
  @override
  Either<UnsignedTransactionFailure, UnsignedTransaction>
      get unsignedTransaction;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_SendCubitStateCopyWith<_$_SendCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
