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
mixin _$BlockchainCubitState {
  Either<BlockchainFailure, Blockchain> get blockchain =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockchainCubitStateCopyWith<BlockchainCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainCubitStateCopyWith<$Res> {
  factory $BlockchainCubitStateCopyWith(BlockchainCubitState value,
          $Res Function(BlockchainCubitState) then) =
      _$BlockchainCubitStateCopyWithImpl<$Res>;
  $Res call(
      {Either<BlockchainFailure, Blockchain> blockchain,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class _$BlockchainCubitStateCopyWithImpl<$Res>
    implements $BlockchainCubitStateCopyWith<$Res> {
  _$BlockchainCubitStateCopyWithImpl(this._value, this._then);

  final BlockchainCubitState _value;
  // ignore: unused_field
  final $Res Function(BlockchainCubitState) _then;

  @override
  $Res call({
    Object? blockchain = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      blockchain: blockchain == freezed
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as Either<BlockchainFailure, Blockchain>,
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
abstract class _$$_BlockchainCubitStateCopyWith<$Res>
    implements $BlockchainCubitStateCopyWith<$Res> {
  factory _$$_BlockchainCubitStateCopyWith(_$_BlockchainCubitState value,
          $Res Function(_$_BlockchainCubitState) then) =
      __$$_BlockchainCubitStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Either<BlockchainFailure, Blockchain> blockchain,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class __$$_BlockchainCubitStateCopyWithImpl<$Res>
    extends _$BlockchainCubitStateCopyWithImpl<$Res>
    implements _$$_BlockchainCubitStateCopyWith<$Res> {
  __$$_BlockchainCubitStateCopyWithImpl(_$_BlockchainCubitState _value,
      $Res Function(_$_BlockchainCubitState) _then)
      : super(_value, (v) => _then(v as _$_BlockchainCubitState));

  @override
  _$_BlockchainCubitState get _value => super._value as _$_BlockchainCubitState;

  @override
  $Res call({
    Object? blockchain = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$_BlockchainCubitState(
      blockchain: blockchain == freezed
          ? _value.blockchain
          : blockchain // ignore: cast_nullable_to_non_nullable
              as Either<BlockchainFailure, Blockchain>,
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

class _$_BlockchainCubitState implements _BlockchainCubitState {
  const _$_BlockchainCubitState(
      {required this.blockchain,
      required this.showErrorMessages,
      required this.isSubmitting});

  @override
  final Either<BlockchainFailure, Blockchain> blockchain;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'BlockchainCubitState(blockchain: $blockchain, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlockchainCubitState &&
            const DeepCollectionEquality()
                .equals(other.blockchain, blockchain) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(blockchain),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting));

  @JsonKey(ignore: true)
  @override
  _$$_BlockchainCubitStateCopyWith<_$_BlockchainCubitState> get copyWith =>
      __$$_BlockchainCubitStateCopyWithImpl<_$_BlockchainCubitState>(
          this, _$identity);
}

abstract class _BlockchainCubitState implements BlockchainCubitState {
  const factory _BlockchainCubitState(
      {required final Either<BlockchainFailure, Blockchain> blockchain,
      required final bool showErrorMessages,
      required final bool isSubmitting}) = _$_BlockchainCubitState;

  @override
  Either<BlockchainFailure, Blockchain> get blockchain;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_BlockchainCubitStateCopyWith<_$_BlockchainCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
