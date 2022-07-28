part of 'address.dart';

// primary key - address

class _AddressKey extends Key<AddressDeviceRecord> {
  @override
  String getKey(AddressDeviceRecord address) => address.address;
}

extension ByAddressMethodsForAddress
    on Index<_AddressKey, AddressDeviceRecord> {
  AddressDeviceRecord? getOne(String? address) =>
      address == null ? null : getByKeyStr(address).firstOrNull;
}
