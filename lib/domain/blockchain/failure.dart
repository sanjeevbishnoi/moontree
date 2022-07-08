import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class BlockchainFailure with _$BlockchainFailure {
  const factory BlockchainFailure.invalidBlockchain() = InvalidBlockchain;
}
