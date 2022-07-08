part of 'cubit.dart';

@freezed
class HoldingCubitState with _$HoldingCubitState {
  const factory HoldingCubitState({
    required Either<HoldingFailure, Holding> holding,
    required bool showErrorMessages,
    required bool isSubmitting,
  }) = _HoldingCubitState;

  factory HoldingCubitState.initial() => HoldingCubitState(
      holding: right(Holding.empty()),
      showErrorMessages: false,
      isSubmitting: false);

  factory HoldingCubitState.load(
    Either<HoldingFailure, Holding> holding,
  ) =>
      HoldingCubitState(
        holding: holding,
        showErrorMessages: false,
        isSubmitting: false,
      );
}
