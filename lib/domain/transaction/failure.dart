import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class TransactionFailure with _$TransactionFailure {
  const factory TransactionFailure.invalidTransaction() = InvalidTransaction;
}
