import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension WBHaveAnAsset on WalletBalanceRecord {
  AssetRecord? get asset => data.assets.bySymbol.getOne(symbol);
}

extension WBHaveAWallet on WalletBalanceRecord {
  WalletRecord? get wallet => data.wallets.byId.getOne(pubkey, derivation);
}

extension WBHashManyVouts on WalletBalanceRecord {
  List<VoutRecord>? get vouts => data.vouts.bySymbol.getAll(symbol);
}
