import 'package:collection/collection.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:proclaim/proclaim.dart';

part 'asset.keys.dart';

class AssetProclaim extends Proclaim<_SymbolKey, AssetDeviceRecord> {
  late IndexMultiple<_SymbolKey, AssetDeviceRecord> byId;
  late IndexMultiple<_SymbolKey, AssetDeviceRecord> bySymbol;

  AssetProclaim() : super(_SymbolKey()) {
    bySymbol = addIndexMultiple('bySymbol', _SymbolKey());
    byId = bySymbol;
  }

  Set<String> get ids => records.map((e) => e.id).toSet();
}
