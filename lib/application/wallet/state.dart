part of 'cubit.dart';

@freezed
class WalletCubitState with _$WalletCubitState {
  const factory WalletCubitState({
    required Either<WalletFailure, Wallet> wallet,
    required bool showErrorMessages,
    required bool isSubmitting,
  }) = _WalletCubitState;

  factory WalletCubitState.initial() => WalletCubitState(
      wallet: right(Wallet.empty()),
      showErrorMessages: false,
      isSubmitting: false);

  factory WalletCubitState.load(
    Either<WalletFailure, Wallet> wallet,
  ) =>
      WalletCubitState(
        wallet: wallet,
        showErrorMessages: false,
        isSubmitting: false,
      );
}
