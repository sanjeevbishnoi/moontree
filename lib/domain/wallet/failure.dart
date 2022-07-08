import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class WalletFailure with _$WalletFailure {
  const factory WalletFailure.invalidWallet() = InvalidWallet;
}
