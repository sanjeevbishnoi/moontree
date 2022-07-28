part of 'address_balance.dart';

/// byAddress

class _AddressKey extends Key<AddressBalanceDeviceRecord> {
  @override
  String getKey(AddressBalanceDeviceRecord address) => address.address;
}

extension ByAddressKeyMethodsForAddressBalance
    on IndexMultiple<_AddressKey, AddressBalanceDeviceRecord> {
  List<AddressBalanceDeviceRecord> getAll(String address) =>
      getByKeyStr(address);
}

/// byId - primary key

class _IdKey extends Key<AddressBalanceDeviceRecord> {
  @override
  String getKey(AddressBalanceDeviceRecord address) => address.id;
}

extension ByIdMethodsForAddressBalance
    on Index<_IdKey, AddressBalanceDeviceRecord> {
  AddressBalanceDeviceRecord? getOne(
          String address, String symbol, int? height) =>
      getByKeyStr(
              AddressBalanceDeviceRecord.generateId(address, symbol, height))
          .firstOrNull;
}
