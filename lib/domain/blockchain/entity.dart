import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/blockchain/values.dart';
import 'package:moontree/domain/wallet/entity.dart';

part 'entity.freezed.dart';

@freezed
abstract class Blockchain with _$Blockchain {
  const factory Blockchain({
    required Protocol protocol,
    required List<Wallet> wallets,
  }) = _Blockchain;

  factory Blockchain.empty() => Blockchain(
        protocol: Protocol.empty(),
        wallets: <Wallet>[],
      );
}
