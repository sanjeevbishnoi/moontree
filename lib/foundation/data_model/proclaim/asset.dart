import 'package:collection/collection.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:proclaim/proclaim.dart';

part 'asset.keys.dart';

class AssetProclaim extends Proclaim<_SymbolKey, AssetRecord> {
  late IndexMultiple<_SymbolKey, AssetRecord> byId;
  late IndexMultiple<_SymbolKey, AssetRecord> bySymbol;

  AssetProclaim() : super(_SymbolKey()) {
    bySymbol = addIndexMultiple('bySymbol', _SymbolKey());
    byId = bySymbol;
  }

  static Map<String, AssetRecord> get defaults => {
        'RVN': AssetRecord(
          symbol: 'RVN',
          /*name: 'Ravencoin',*/
          divisibility: 8,
          supply: 21000300000,
          reissuable: false,
        ),
        //'MOONTREE': AssetRecord(
        //  symbol: 'MOONTREE',
        //  /*name: 'Moontree',*/
        //  divisibility: 4,
        //  supply: 12000000000,
        //  reissuable: true,
        //)
      };

  Set<String> get ids => records.map((e) => e.id).toSet();
}
