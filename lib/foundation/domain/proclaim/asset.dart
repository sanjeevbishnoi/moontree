import 'package:collection/collection.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/foundation/domain/records/asset.dart';
import 'package:proclaim/proclaim.dart';

part 'asset.keys.dart';

class AssetProclaim extends Proclaim<_AssetKey, DomainAsset> {
  late IndexMultiple<_AssetKey, DomainAsset> byId;
  late IndexMultiple<_AssetKey, DomainAsset> byFullNameAssetType;

  AssetProclaim() : super(_AssetKey()) {
    byId = addIndexMultiple('id', _AssetKey());
    byFullNameAssetType = addIndexMultiple('byFullNameAssetType', _AssetKey());
  }
}
