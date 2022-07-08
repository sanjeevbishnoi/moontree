part of 'cubit.dart';

@freezed
class TransactionCubitState with _$TransactionCubitState {
  const factory TransactionCubitState({
    required Either<TransactionFailure, Transaction> transaction,
    required bool showErrorMessages,
    required bool isSubmitting,
  }) = _TransactionCubitState;

  factory TransactionCubitState.initial() => TransactionCubitState(
      transaction: right(Transaction.empty()),
      showErrorMessages: false,
      isSubmitting: false);

  factory TransactionCubitState.load(
    Either<TransactionFailure, Transaction> transaction,
  ) =>
      TransactionCubitState(
        transaction: transaction,
        showErrorMessages: false,
        isSubmitting: false,
      );
}
