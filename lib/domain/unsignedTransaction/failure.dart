import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class UnsignedTransactionFailure with _$UnsignedTransactionFailure {
  const factory UnsignedTransactionFailure.invalidUnsignedTransaction() =
      InvalidUnsignedTransaction;
  const factory UnsignedTransactionFailure.sendAmountLargerThanSendUnspents() =
      sendAmountLargerThanSendUnspents;
  const factory UnsignedTransactionFailure.sendHasNoRavenForFee() =
      sendHasNoRavenForFee;
  const factory UnsignedTransactionFailure.sendAmountAndFeeLargerThanSendUnspents() =
      sendAmountAndFeeLargerThanSendUnspents;
}
