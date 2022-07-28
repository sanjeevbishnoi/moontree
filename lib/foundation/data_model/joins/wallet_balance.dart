import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

extension WBHaveAnAsset on WalletBalanceDeviceRecord {
  AssetDeviceRecord? get asset => cache.assets.bySymbol.getOne(symbol);
}

extension WBHaveAWallet on WalletBalanceDeviceRecord {
  WalletDeviceRecord? get wallet =>
      cache.wallets.byId.getOne(pubkey, derivation);
}

extension WBHashManyVouts on WalletBalanceDeviceRecord {
  List<VoutDeviceRecord>? get vouts => cache.vouts.bySymbol.getAll(symbol);
}
