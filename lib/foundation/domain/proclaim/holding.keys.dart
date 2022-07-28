part of 'holding.dart';

// primary key - byId

class _IdKey extends Key<DomainHolding> {
  @override
  String getKey(DomainHolding holding) => holding.id;
}

extension ByIdMethodsForId on Index<_IdKey, DomainHolding> {
  DomainHolding? getOne(
          FullName fullName, AssetType assetType, Amount amount) =>
      getByKeyStr(DomainHolding.getId(fullName, assetType, amount)).firstOrNull;
}
