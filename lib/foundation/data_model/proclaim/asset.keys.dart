part of 'asset.dart';

// primary key - Symbol

class _AssetKey extends Key<Asset> {
  @override
  String getKey(Asset asset) => asset.id;
}

extension ByAssetMethodsForAsset on Index<_AssetKey, Asset> {
  Asset? getOne(String symbol) => getByKeyStr(symbol).firstOrNull;
}
