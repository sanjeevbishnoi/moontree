import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain_model/records/unspent.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class ToUnspentDomain extends Trigger {
  void init() => when(
      thereIsA: data.vouts.changes,
      andIf: null,
      doThis: (Change<VoutDeviceRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) => remove(removed.record),
          ));

  /// puts the record into memory
  static Future<void> load(VoutDeviceRecord vout) async =>
      await domain.unspents.saveAll(DomainUnspent.from(
        vout,
        Protocol.ravencoinMainnet,
      ));

  /// only happens on reorgs
  static Future<void> remove(VoutDeviceRecord vout) async =>
      await domain.unspents.removeAll(DomainUnspent.from(
        vout,
        Protocol.ravencoinMainnet,
      ));
  /*
*/
}
