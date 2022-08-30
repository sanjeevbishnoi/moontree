import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;

class EmptySet {
  Map<String, AddressBalanceDeviceRecord> get addressBalances => {};
  Map<String, AddressDeviceRecord> get addresses => {};
  Map<String, AssetDeviceRecord> get assets => {};
  Map<String, ComboDeviceRecord> get combo => {};
  Map<String, GenericDeviceRecord> get generic => {};
  Map<String, TransactionDeviceRecord> get transactions => {};
  Map<String, VinDeviceRecord> get vins => {};
  Map<String, VoutDeviceRecord> get vouts => {};
  Map<String, WalletAddressDeviceRecord> get walletsAddresses => {};
  Map<String, WalletBalanceDeviceRecord> get walletBalances => {};
  Map<String, WalletDeviceRecord> get wallets => {};
}

class DefaultSet extends EmptySet {
  @override
  Map<String, AddressBalanceDeviceRecord> get addressBalances =>
      data.AddressBalanceProclaim.defaults;
  @override
  Map<String, AddressDeviceRecord> get addresses =>
      data.AddressProclaim.defaults;
  @override
  Map<String, AssetDeviceRecord> get assets => data.AssetProclaim.defaults;
  @override
  Map<String, TransactionDeviceRecord> get transactions =>
      data.TransactionProclaim.defaults;
  @override
  Map<String, VinDeviceRecord> get vins => data.VinProclaim.defaults;
  @override
  Map<String, VoutDeviceRecord> get vouts => data.VoutProclaim.defaults;
  @override
  Map<String, WalletAddressDeviceRecord> get walletsAddresses =>
      data.WalletAddressProclaim.defaults;
  @override
  Map<String, WalletBalanceDeviceRecord> get walletBalances =>
      data.WalletBalanceProclaim.defaults;
  @override
  Map<String, WalletDeviceRecord> get wallets => data.WalletProclaim.defaults;
}
