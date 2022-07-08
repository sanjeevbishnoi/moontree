import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class TransactionDetailFailure with _$TransactionDetailFailure {
  const factory TransactionDetailFailure.invalidTransactionDetail() =
      InvalidTransactionDetail;
}
