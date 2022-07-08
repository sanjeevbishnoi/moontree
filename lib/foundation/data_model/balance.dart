import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class WalletBalance with HiveObjectMixin, EquatableMixin {
  @HiveField(0)
  final int walletId;

  @HiveField(1)
  final int? assetId;

  @HiveField(2)
  final int sats;

  @HiveField(3)
  final int height;

  @override
  List<Object?> get props => [
        walletId,
        assetId,
        sats,
        height,
      ];

  WalletBalance({
    required this.walletId,
    required this.assetId,
    required this.sats,
    required this.height,
  });

  factory WalletBalance.from(client.WalletBalanceHistory walletBalance) =>
      WalletBalance(
        walletId: walletBalance.wallet_id,
        assetId: walletBalance.asset_id,
        sats: walletBalance.sats,
        height: walletBalance.height,
      );
}
