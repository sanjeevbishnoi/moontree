part of 'asset.dart';

// primary key - Symbol

class _SymbolKey extends Key<AssetRecord> {
  @override
  String getKey(AssetRecord asset) => asset.symbol;
}

extension BySymbolKeyMethodsForAsset on Index<_SymbolKey, AssetRecord> {
  AssetRecord? getOne(String symbol) => getByKeyStr(symbol).firstOrNull;
}
