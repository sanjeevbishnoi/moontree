part of 'wallet.dart';

// primary key - byId

class _IdKey extends Key<DomainWallet> {
  @override
  String getKey(DomainWallet holding) => holding.id;
}

extension ByIdMethodsForDomainWallet on Index<_IdKey, DomainWallet> {
  DomainWallet? getOne(String pub) =>
      getByKeyStr(DomainWallet.generateId(pub)).firstOrNull;
}

// name

class _NameIdKey extends Key<DomainWallet> {
  @override
  String getKey(DomainWallet holding) => holding.name;
}

extension ByNameIdMethodsForDomainWallet on Index<_NameIdKey, DomainWallet> {
  List<DomainWallet> getAll(String name) => getByKeyStr(name);
}
