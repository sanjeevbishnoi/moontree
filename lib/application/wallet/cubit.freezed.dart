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
mixin _$WalletCubitState {
  Either<WalletFailure, Wallet> get wallet =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletCubitStateCopyWith<WalletCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCubitStateCopyWith<$Res> {
  factory $WalletCubitStateCopyWith(
          WalletCubitState value, $Res Function(WalletCubitState) then) =
      _$WalletCubitStateCopyWithImpl<$Res>;
  $Res call(
      {Either<WalletFailure, Wallet> wallet,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class _$WalletCubitStateCopyWithImpl<$Res>
    implements $WalletCubitStateCopyWith<$Res> {
  _$WalletCubitStateCopyWithImpl(this._value, this._then);

  final WalletCubitState _value;
  // ignore: unused_field
  final $Res Function(WalletCubitState) _then;

  @override
  $Res call({
    Object? wallet = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      wallet: wallet == freezed
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Either<WalletFailure, Wallet>,
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
abstract class _$$_WalletCubitStateCopyWith<$Res>
    implements $WalletCubitStateCopyWith<$Res> {
  factory _$$_WalletCubitStateCopyWith(
          _$_WalletCubitState value, $Res Function(_$_WalletCubitState) then) =
      __$$_WalletCubitStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Either<WalletFailure, Wallet> wallet,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class __$$_WalletCubitStateCopyWithImpl<$Res>
    extends _$WalletCubitStateCopyWithImpl<$Res>
    implements _$$_WalletCubitStateCopyWith<$Res> {
  __$$_WalletCubitStateCopyWithImpl(
      _$_WalletCubitState _value, $Res Function(_$_WalletCubitState) _then)
      : super(_value, (v) => _then(v as _$_WalletCubitState));

  @override
  _$_WalletCubitState get _value => super._value as _$_WalletCubitState;

  @override
  $Res call({
    Object? wallet = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$_WalletCubitState(
      wallet: wallet == freezed
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Either<WalletFailure, Wallet>,
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

class _$_WalletCubitState implements _WalletCubitState {
  const _$_WalletCubitState(
      {required this.wallet,
      required this.showErrorMessages,
      required this.isSubmitting});

  @override
  final Either<WalletFailure, Wallet> wallet;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'WalletCubitState(wallet: $wallet, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WalletCubitState &&
            const DeepCollectionEquality().equals(other.wallet, wallet) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wallet),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting));

  @JsonKey(ignore: true)
  @override
  _$$_WalletCubitStateCopyWith<_$_WalletCubitState> get copyWith =>
      __$$_WalletCubitStateCopyWithImpl<_$_WalletCubitState>(this, _$identity);
}

abstract class _WalletCubitState implements WalletCubitState {
  const factory _WalletCubitState(
      {required final Either<WalletFailure, Wallet> wallet,
      required final bool showErrorMessages,
      required final bool isSubmitting}) = _$_WalletCubitState;

  @override
  Either<WalletFailure, Wallet> get wallet;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_WalletCubitStateCopyWith<_$_WalletCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
