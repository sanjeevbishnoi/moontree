import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class HoldingFailure with _$HoldingFailure {
  const factory HoldingFailure.invalidHolding() = InvalidHolding;
}
