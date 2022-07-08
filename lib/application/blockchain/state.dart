part of 'cubit.dart';

@freezed
class BlockchainCubitState with _$BlockchainCubitState {
  const factory BlockchainCubitState({
    required Either<BlockchainFailure, Blockchain> blockchain,
    required bool showErrorMessages,
    required bool isSubmitting,
  }) = _BlockchainCubitState;

  factory BlockchainCubitState.initial() => BlockchainCubitState(
      blockchain: right(Blockchain.empty()),
      showErrorMessages: false,
      isSubmitting: false);

  factory BlockchainCubitState.load(
    Either<BlockchainFailure, Blockchain> blockchain,
  ) =>
      BlockchainCubitState(
        blockchain: blockchain,
        showErrorMessages: false,
        isSubmitting: false,
      );
}
