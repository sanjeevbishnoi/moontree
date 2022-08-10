import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain_model/records/asset.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class ToAssetDomain extends Trigger {
  void init() => when(
      thereIsA: datamodel.assets.changes,
      andIf: null,
      doThis: (Change<AssetDeviceRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) => remove(removed.record),
          ));

  /// puts the record into memory
  Future<void> load(AssetDeviceRecord asset) async =>
      await domain.assets.save(DomainAsset.from(
        asset,
        Protocol.ravencoinMainnet,
      ));

  /// only happens on reorgs
  Future<void> remove(AssetDeviceRecord asset) async =>
      await domain.assets.remove(DomainAsset.from(
        asset,
        Protocol.ravencoinMainnet,
      ));
}
