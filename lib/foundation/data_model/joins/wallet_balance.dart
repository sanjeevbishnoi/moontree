import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension WBHaveAnAsset on WalletBalanceDeviceRecord {
  AssetDeviceRecord? get asset => data.assets.bySymbol.getOne(symbol);
}

extension WBHaveAWallet on WalletBalanceDeviceRecord {
  WalletDeviceRecord? get wallet =>
      data.wallets.byId.getOne(pubkey, derivation);
}

extension WBHashManyVouts on WalletBalanceDeviceRecord {
  List<VoutDeviceRecord>? get vouts => data.vouts.bySymbol.getAll(symbol);
}
