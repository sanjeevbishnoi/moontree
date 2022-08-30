import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension AssetRHasManyVoutDeviceRecords on AssetDeviceRecord {
  List<VoutDeviceRecord> get vouts => data.vouts.bySymbol.getAll(symbol);
}

extension AssetRHasManyAddressBalanceDeviceRecords on AssetDeviceRecord {
  List<AddressBalanceDeviceRecord> get addressBalances =>
      data.addressBalances.bySymbol.getAll(symbol);
}

extension AssetRHasManyWalletBalanceDeviceRecords on AssetDeviceRecord {
  List<WalletBalanceDeviceRecord> get walletBalances =>
      data.walletsBalances.bySymbol.getAll(symbol);
}
