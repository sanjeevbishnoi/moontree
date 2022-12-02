import 'package:proclaim/proclaim.dart' show MapSource;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;

/// can be called from or moved to anywhere - like spash screen:
class DataModel {
  static Future<void> init({
    Map<String, AddressBalanceRecord>? addressBalances,
    Map<String, AddressRecord>? addresses,
    Map<String, AssetRecord>? assets,
    Map<String, ComboRecord>? combo,
    Map<String, GenericRecord>? generic,
    Map<String, TransactionRecord>? transactions,
    Map<String, VinRecord>? vins,
    Map<String, VoutRecord>? vouts,
    Map<String, WalletAddressRecord>? walletsAddresses,
    Map<String, WalletBalanceRecord>? walletBalances,
    Map<String, WalletRecord>? wallets,
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
