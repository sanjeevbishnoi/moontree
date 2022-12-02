import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;

class EmptySet {
  Map<String, AddressBalanceRecord> get addressBalances => {};
  Map<String, AddressRecord> get addresses => {};
  Map<String, AssetRecord> get assets => {};
  Map<String, ComboRecord> get combo => {};
  Map<String, GenericRecord> get generic => {};
  Map<String, TransactionRecord> get transactions => {};
  Map<String, VinRecord> get vins => {};
  Map<String, VoutRecord> get vouts => {};
  Map<String, WalletAddressRecord> get walletsAddresses => {};
  Map<String, WalletBalanceRecord> get walletBalances => {};
  Map<String, WalletRecord> get wallets => {};
}

class DefaultSet extends EmptySet {
  @override
  Map<String, AddressBalanceRecord> get addressBalances =>
      data.AddressBalanceProclaim.defaults;
  @override
  Map<String, AddressRecord> get addresses => data.AddressProclaim.defaults;
  @override
  Map<String, AssetRecord> get assets => data.AssetProclaim.defaults;
  @override
  Map<String, TransactionRecord> get transactions =>
      data.TransactionProclaim.defaults;
  @override
  Map<String, VinRecord> get vins => data.VinProclaim.defaults;
  @override
  Map<String, VoutRecord> get vouts => data.VoutProclaim.defaults;
  @override
  Map<String, WalletAddressRecord> get walletsAddresses =>
      data.WalletAddressProclaim.defaults;
  @override
  Map<String, WalletBalanceRecord> get walletBalances =>
      data.WalletBalanceProclaim.defaults;
  @override
  Map<String, WalletRecord> get wallets => data.WalletProclaim.defaults;
}
