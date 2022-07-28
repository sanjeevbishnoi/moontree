part of 'asset.dart';

// primary key - Symbol

class _SymbolKey extends Key<AssetDeviceRecord> {
  @override
  String getKey(AssetDeviceRecord asset) => asset.symbol;
}

extension BySymbolKeyMethodsForAsset on Index<_SymbolKey, AssetDeviceRecord> {
  AssetDeviceRecord? getOne(String symbol) => getByKeyStr(symbol).firstOrNull;
}
