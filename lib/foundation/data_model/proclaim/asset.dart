import 'package:collection/collection.dart';
import 'package:moontree/foundation/data_model/records/asset.dart';
import 'package:proclaim/proclaim.dart';

part 'asset.keys.dart';

class AssetProclaim extends Proclaim<_AssetKey, Asset> {
  late IndexMultiple<_AssetKey, Asset> byId;
  late IndexMultiple<_AssetKey, Asset> bySymbol;

  AssetProclaim() : super(_AssetKey()) {
    byId = addIndexMultiple('id', _AssetKey());
    bySymbol = addIndexMultiple('bySymbol', _AssetKey());
  }
}
