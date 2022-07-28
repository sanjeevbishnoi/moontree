part of 'wallet_balance.dart';

/// byWalletId

class _WalletKey extends Key<WalletBalanceDeviceRecord> {
  @override
  String getKey(WalletBalanceDeviceRecord balance) => balance.walletId;
}

extension ByWalletKeyMethodsForWalletBalance
    on IndexMultiple<_WalletKey, WalletBalanceDeviceRecord> {
  List<WalletBalanceDeviceRecord> getAll(String pubkey, String? derviation) =>
      getByKeyStr(
          WalletBalanceDeviceRecord.generateWalletId(pubkey, derviation));
}

/// byId - primary key

class _IdKey extends Key<WalletBalanceDeviceRecord> {
  @override
  String getKey(WalletBalanceDeviceRecord balance) => balance.id;
}

extension ByIdMethodsForWalletBalance
    on Index<_IdKey, WalletBalanceDeviceRecord> {
  WalletBalanceDeviceRecord? getOne(
          String pubkey, String? derviation, String symbol, int? height) =>
      getByKeyStr(WalletBalanceDeviceRecord.generateId(
              pubkey, derviation, symbol, height))
          .firstOrNull;
}

/// bySymbol

class _SymbolKey extends Key<WalletBalanceDeviceRecord> {
  @override
  String getKey(WalletBalanceDeviceRecord balance) => balance.symbol;
}

extension BySymbolKeyMethodsForWalletBalance
    on Index<_SymbolKey, WalletBalanceDeviceRecord> {
  List<WalletBalanceDeviceRecord> getAll(String? symbol) =>
      getByKeyStr(symbol ?? 'RVN');
}
