import 'package:proclaim/proclaim.dart' show MapSource;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;

/// can be called from or moved to anywhere - like spash screen:
class DataModel {
  static Future<void> init({
    Map<String, AddressBalanceDeviceRecord>? addressBalances,
    Map<String, AddressDeviceRecord>? addresses,
    Map<String, AssetDeviceRecord>? assets,
    Map<String, ComboDeviceRecord>? combo,
    Map<String, GenericDeviceRecord>? generic,
    Map<String, TransactionDeviceRecord>? transactions,
    Map<String, VinDeviceRecord>? vins,
    Map<String, VoutDeviceRecord>? vouts,
    Map<String, WalletAddressDeviceRecord>? walletsAddresses,
    Map<String, WalletBalanceDeviceRecord>? walletBalances,
    Map<String, WalletDeviceRecord>? wallets,
  }) async {
    data.addressBalances.setSource(
      MapSource(addressBalances ?? data.AddressBalanceProclaim.defaults),
    );
    data.addresses.setSource(
      MapSource(addresses ?? data.AddressProclaim.defaults),
    );
    data.assets.setSource(
      MapSource(assets ?? data.AssetProclaim.defaults),
    );
    data.transactions.setSource(
      MapSource(transactions ?? data.TransactionProclaim.defaults),
    );
    data.vins.setSource(
      MapSource(vins ?? data.VinProclaim.defaults),
    );
    data.vouts.setSource(
      MapSource(vouts ?? data.VoutProclaim.defaults),
    );
    data.walletsAddresses.setSource(
      MapSource(walletsAddresses ?? data.WalletAddressProclaim.defaults),
    );
    data.walletsBalances.setSource(
      MapSource(walletBalances ?? data.WalletBalanceProclaim.defaults),
    );
    data.wallets.setSource(
      MapSource(wallets ?? data.WalletProclaim.defaults),
    );
  }
}
