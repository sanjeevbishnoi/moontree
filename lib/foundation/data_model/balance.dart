/// might want an address balance object too...

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:utils/mixins/string.dart';

class WalletBalance with HiveObjectMixin, EquatableMixin, ToStringMixin {
  @HiveField(0)
  final String walletPubKey;

  @HiveField(1)
  final String assetSymbol;

  @HiveField(2)
  final int sats;

  @HiveField(3)
  final int height;

  WalletBalance({
    required this.walletPubKey,
    required this.assetSymbol,
    required this.sats,
    required this.height,
  });

  @override
  List<Object?> get props => [
        walletPubKey,
        assetSymbol,
        sats,
        height,
      ];

  @override
  List<String> get propNames => [
        'walletPubKey',
        'assetSymbol',
        'sats',
        'height',
      ];

  @override
  bool? get stringify => true;

  /// will be given exactly what we want. this isn't needed
  //import 'package:moontree_client/moontree_client.dart' as client;
  //factory WalletBalance.from(client.WalletBalanceIncremental walletBalance) =>
  //    WalletBalance(
  //      walletId: walletBalance.wallet_id,
  //      assetId: walletBalance.asset_id,
  //      sats: walletBalance.sats,
  //      height: walletBalance.height,
  //    );
}
