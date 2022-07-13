part of 'address.dart';

// primary key - address

class _AddressKey extends Key<DomainAddress> {
  @override
  String getKey(DomainAddress address) => address.id;
}

extension ByAddressMethodsForAddress on Index<_AddressKey, DomainAddress> {
  DomainAddress? getOne(String address) => getByKeyStr(address).firstOrNull;
}

/// byId

class _IdKey extends Key<DomainAddress> {
  @override
  String getKey(DomainAddress address) => address.id.toString();
}

extension ByIdMethodsForAddress on Index<_IdKey, DomainAddress> {
  DomainAddress? getOne(int addressId) =>
      getByKeyStr(addressId.toString()).firstOrNull;
}
