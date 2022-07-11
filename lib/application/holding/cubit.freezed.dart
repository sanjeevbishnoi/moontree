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
mixin _$HoldingCubitState {
  Either<HoldingFailure, Holding> get holding =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HoldingCubitStateCopyWith<HoldingCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HoldingCubitStateCopyWith<$Res> {
  factory $HoldingCubitStateCopyWith(
          HoldingCubitState value, $Res Function(HoldingCubitState) then) =
      _$HoldingCubitStateCopyWithImpl<$Res>;
  $Res call(
      {Either<HoldingFailure, Holding> holding,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class _$HoldingCubitStateCopyWithImpl<$Res>
    implements $HoldingCubitStateCopyWith<$Res> {
  _$HoldingCubitStateCopyWithImpl(this._value, this._then);

  final HoldingCubitState _value;
  // ignore: unused_field
  final $Res Function(HoldingCubitState) _then;

  @override
  $Res call({
    Object? holding = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      holding: holding == freezed
          ? _value.holding
          : holding // ignore: cast_nullable_to_non_nullable
              as Either<HoldingFailure, Holding>,
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
abstract class _$$_HoldingCubitStateCopyWith<$Res>
    implements $HoldingCubitStateCopyWith<$Res> {
  factory _$$_HoldingCubitStateCopyWith(_$_HoldingCubitState value,
          $Res Function(_$_HoldingCubitState) then) =
      __$$_HoldingCubitStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Either<HoldingFailure, Holding> holding,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class __$$_HoldingCubitStateCopyWithImpl<$Res>
    extends _$HoldingCubitStateCopyWithImpl<$Res>
    implements _$$_HoldingCubitStateCopyWith<$Res> {
  __$$_HoldingCubitStateCopyWithImpl(
      _$_HoldingCubitState _value, $Res Function(_$_HoldingCubitState) _then)
      : super(_value, (v) => _then(v as _$_HoldingCubitState));

  @override
  _$_HoldingCubitState get _value => super._value as _$_HoldingCubitState;

  @override
  $Res call({
    Object? holding = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$_HoldingCubitState(
      holding: holding == freezed
          ? _value.holding
          : holding // ignore: cast_nullable_to_non_nullable
              as Either<HoldingFailure, Holding>,
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

class _$_HoldingCubitState implements _HoldingCubitState {
  const _$_HoldingCubitState(
      {required this.holding,
      required this.showErrorMessages,
      required this.isSubmitting});

  @override
  final Either<HoldingFailure, Holding> holding;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'HoldingCubitState(holding: $holding, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HoldingCubitState &&
            const DeepCollectionEquality().equals(other.holding, holding) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(holding),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting));

  @JsonKey(ignore: true)
  @override
  _$$_HoldingCubitStateCopyWith<_$_HoldingCubitState> get copyWith =>
      __$$_HoldingCubitStateCopyWithImpl<_$_HoldingCubitState>(
          this, _$identity);
}

abstract class _HoldingCubitState implements HoldingCubitState {
  const factory _HoldingCubitState(
      {required final Either<HoldingFailure, Holding> holding,
      required final bool showErrorMessages,
      required final bool isSubmitting}) = _$_HoldingCubitState;

  @override
  Either<HoldingFailure, Holding> get holding;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_HoldingCubitStateCopyWith<_$_HoldingCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
