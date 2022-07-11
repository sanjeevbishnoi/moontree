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
mixin _$AddressCubitState {
  Either<AddressFailure, Address> get address =>
      throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressCubitStateCopyWith<AddressCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCubitStateCopyWith<$Res> {
  factory $AddressCubitStateCopyWith(
          AddressCubitState value, $Res Function(AddressCubitState) then) =
      _$AddressCubitStateCopyWithImpl<$Res>;
  $Res call(
      {Either<AddressFailure, Address> address,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class _$AddressCubitStateCopyWithImpl<$Res>
    implements $AddressCubitStateCopyWith<$Res> {
  _$AddressCubitStateCopyWithImpl(this._value, this._then);

  final AddressCubitState _value;
  // ignore: unused_field
  final $Res Function(AddressCubitState) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Either<AddressFailure, Address>,
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
abstract class _$$_AddressCubitStateCopyWith<$Res>
    implements $AddressCubitStateCopyWith<$Res> {
  factory _$$_AddressCubitStateCopyWith(_$_AddressCubitState value,
          $Res Function(_$_AddressCubitState) then) =
      __$$_AddressCubitStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Either<AddressFailure, Address> address,
      bool showErrorMessages,
      bool isSubmitting});
}

/// @nodoc
class __$$_AddressCubitStateCopyWithImpl<$Res>
    extends _$AddressCubitStateCopyWithImpl<$Res>
    implements _$$_AddressCubitStateCopyWith<$Res> {
  __$$_AddressCubitStateCopyWithImpl(
      _$_AddressCubitState _value, $Res Function(_$_AddressCubitState) _then)
      : super(_value, (v) => _then(v as _$_AddressCubitState));

  @override
  _$_AddressCubitState get _value => super._value as _$_AddressCubitState;

  @override
  $Res call({
    Object? address = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$_AddressCubitState(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Either<AddressFailure, Address>,
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

class _$_AddressCubitState implements _AddressCubitState {
  const _$_AddressCubitState(
      {required this.address,
      required this.showErrorMessages,
      required this.isSubmitting});

  @override
  final Either<AddressFailure, Address> address;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;

  @override
  String toString() {
    return 'AddressCubitState(address: $address, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressCubitState &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSubmitting));

  @JsonKey(ignore: true)
  @override
  _$$_AddressCubitStateCopyWith<_$_AddressCubitState> get copyWith =>
      __$$_AddressCubitStateCopyWithImpl<_$_AddressCubitState>(
          this, _$identity);
}

abstract class _AddressCubitState implements AddressCubitState {
  const factory _AddressCubitState(
      {required final Either<AddressFailure, Address> address,
      required final bool showErrorMessages,
      required final bool isSubmitting}) = _$_AddressCubitState;

  @override
  Either<AddressFailure, Address> get address;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCubitStateCopyWith<_$_AddressCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
