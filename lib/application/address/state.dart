part of 'cubit.dart';

@freezed
class AddressCubitState with _$AddressCubitState {
  const factory AddressCubitState({
    required Either<AddressFailure, Address> address,
    required bool showErrorMessages,
    required bool isSubmitting,
  }) = _AddressCubitState;

  factory AddressCubitState.initial() => AddressCubitState(
      address: right(Address.empty()),
      showErrorMessages: false,
      isSubmitting: false);

  factory AddressCubitState.load(
    Either<AddressFailure, Address> address,
  ) =>
      AddressCubitState(
        address: address,
        showErrorMessages: false,
        isSubmitting: false,
      );
}
