part of 'asset.dart';

// primary key - byId

class _AssetKey extends Key<DomainAsset> {
  @override
  String getKey(DomainAsset address) => address.id;
}

extension ByAssetMethodsForAsset on Index<_AssetKey, DomainAsset> {
  DomainAsset? getOne(FullName fullName, AssetType assetType) =>
      getByKeyStr(DomainAsset.getId(fullName, assetType)).firstOrNull;
}
