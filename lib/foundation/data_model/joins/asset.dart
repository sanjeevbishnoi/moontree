import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension AssetRHasManyVoutRecords on AssetRecord {
  List<VoutRecord> get vouts => data.vouts.bySymbol.getAll(symbol);
}

extension AssetRHasManyAddressBalanceRecords on AssetRecord {
  List<AddressBalanceRecord> get addressBalances =>
      data.addressBalances.bySymbol.getAll(symbol);
}

extension AssetRHasManyWalletBalanceRecords on AssetRecord {
  List<WalletBalanceRecord> get walletBalances =>
      data.walletsBalances.bySymbol.getAll(symbol);
}
