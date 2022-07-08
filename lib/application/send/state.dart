part of 'cubit.dart';

@freezed
class SendCubitState with _$SendCubitState {
  const factory SendCubitState({
    required Either<SendFailure, Send> send,
    required Either<UnsignedTransactionFailure, UnsignedTransaction>
        unsignedTransaction,
    required bool showErrorMessages,
    required bool isSubmitting,
  }) = _SendCubitState;

  factory SendCubitState.initial() => SendCubitState(
        send: right(Send.empty()),
        unsignedTransaction: right(UnsignedTransaction.empty()),
        showErrorMessages: false,
        isSubmitting: false,
      );

  factory SendCubitState.load({
    required Either<SendFailure, Send> send,
    required Either<UnsignedTransactionFailure, UnsignedTransaction>
        unsignedTransaction,
  }) =>
      SendCubitState(
        send: send,
        unsignedTransaction: unsignedTransaction,
        showErrorMessages: false,
        isSubmitting: false,
      );
}
