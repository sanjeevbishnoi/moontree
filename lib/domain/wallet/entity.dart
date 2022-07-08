import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/wallet/values.dart';

part 'entity.freezed.dart';

@freezed
abstract class Wallet with _$Wallet {
  const factory Wallet({
    required WalletName name,
    required HashedEntropy hashedEntropy,
    required PrivKey privKey,
    required PubKey pubKey,
    required PubKeyAddress receiveAddress,
    required List<Holding> holdings,
  }) = _Wallet;

  factory Wallet.empty() => Wallet(
      name: WalletName.empty(),
      hashedEntropy: HashedEntropy.empty(),
      privKey: PrivKey.empty(),
      pubKey: PubKey.empty(),
      holdings: <Holding>[],
      receiveAddress: PubKeyAddress.empty());
}
