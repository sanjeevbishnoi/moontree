part of 'address.dart';

// primary key - address

class _AddressKey extends Key<AddressRecord> {
  @override
  String getKey(AddressRecord address) => address.address;
}

extension ByAddressMethodsForAddress on Index<_AddressKey, AddressRecord> {
  AddressRecord? getOne(String? address) =>
      address == null ? null : getByKeyStr(address).firstOrNull;
}
