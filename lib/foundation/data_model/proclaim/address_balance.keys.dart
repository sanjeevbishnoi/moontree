part of 'address_balance.dart';

/// byAddress

class _AddressKey extends Key<AddressBalanceRecord> {
  @override
  String getKey(AddressBalanceRecord address) => address.address;
}

extension ByAddressKeyMethodsForAddressBalance
    on IndexMultiple<_AddressKey, AddressBalanceRecord> {
  List<AddressBalanceRecord> getAll(String address) => getByKeyStr(address);
}

/// byId - primary key

class _IdKey extends Key<AddressBalanceRecord> {
  @override
  String getKey(AddressBalanceRecord address) => address.id;
}

extension ByIdMethodsForAddressBalance on Index<_IdKey, AddressBalanceRecord> {
  AddressBalanceRecord? getOne(String address, String symbol, int? height) =>
      getByKeyStr(AddressBalanceRecord.generateId(address, symbol, height))
          .firstOrNull;
}

/// bySymbol

class _SymbolKey extends Key<AddressBalanceRecord> {
  @override
  String getKey(AddressBalanceRecord address) => address.symbol;
}

extension BySymbolKeyMethodsForAddressBalance
    on IndexMultiple<_SymbolKey, AddressBalanceRecord> {
  List<AddressBalanceRecord> getAll(String symbol) => getByKeyStr(symbol);
}
