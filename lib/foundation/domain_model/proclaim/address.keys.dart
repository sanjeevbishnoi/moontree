part of 'address.dart';

// primary key - address

class _IdKey extends Key<DomainAddress> {
  @override
  String getKey(DomainAddress address) => address.id;
}

extension ByIdMethodsForAddress on Index<_IdKey, DomainAddress> {
  DomainAddress? getOne(String address) => getByKeyStr(address).firstOrNull;
}

/// byId

class _WalletIdKey extends Key<DomainAddress> {
  @override
  String getKey(DomainAddress address) => address.walletId;
}

extension ByWalletIdMethodsForAddress on Index<_WalletIdKey, DomainAddress> {
  List<DomainAddress> getAll(String walletPub) =>
      getByKeyStr(DomainWallet.generateId(walletPub));
}
