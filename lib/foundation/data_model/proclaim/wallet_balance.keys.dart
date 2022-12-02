part of 'wallet_balance.dart';

/// byWalletId

class _WalletKey extends Key<WalletBalanceRecord> {
  @override
  String getKey(WalletBalanceRecord balance) => balance.walletId;
}

extension ByWalletKeyMethodsForWalletBalance
    on IndexMultiple<_WalletKey, WalletBalanceRecord> {
  List<WalletBalanceRecord> getAll(String pubkey, String? derviation) =>
      getByKeyStr(WalletBalanceRecord.generateWalletId(pubkey, derviation));
}

/// byId - primary key

class _IdKey extends Key<WalletBalanceRecord> {
  @override
  String getKey(WalletBalanceRecord balance) => balance.id;
}

extension ByIdMethodsForWalletBalance on Index<_IdKey, WalletBalanceRecord> {
  WalletBalanceRecord? getOne(
          String pubkey, String? derviation, String symbol, int? height) =>
      getByKeyStr(WalletBalanceRecord.generateId(
              pubkey, derviation, symbol, height))
          .firstOrNull;
}

/// bySymbol

class _SymbolKey extends Key<WalletBalanceRecord> {
  @override
  String getKey(WalletBalanceRecord balance) => balance.symbol;
}

extension BySymbolKeyMethodsForWalletBalance
    on Index<_SymbolKey, WalletBalanceRecord> {
  List<WalletBalanceRecord> getAll(String? symbol) =>
      getByKeyStr(symbol ?? 'RVN');
}
