import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/foundation/data_model/records/asset.dart';
import 'package:moontree/foundation/domain/records/asset.dart';
import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as pros;
import 'package:moontree/foundation/domain/proclaim/proclaim.dart'
    as domain_pros;

// working example where tranlsation happens here.
class AssetToDomain extends Trigger {
  void init() {
    when(
      thereIsA: pros.assets.changes,
      andIf: null,
      doThis: (Change<Asset> change) async => change.when(
          loaded: (loaded) {},
          added: (added) {
            domain_pros.assets.save(DomainAsset(
                fullName: FullName(added.data.symbol),
                assetType: AssetType
                    .unknown, // pass the record to a function to get type
                name: Name(added.data.assetName ?? added.data.symbol)));
          },
          updated: (updated) {},
          removed: (removed) {}),
    );
  }
}
