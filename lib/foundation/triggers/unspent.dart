import 'package:proclaim/change.dart';
import 'package:moontree_utils/moontree_utils.dart' show Trigger;
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
      doThis: (Change<VoutRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) => remove(removed.record),
          ));

  /// puts the record into memory
  static Future<void> load(VoutRecord vout) async =>
      await domain.unspents.saveAll(DomainUnspent.from(
        vout,
        Protocols.ravencoinMainnet,
      ));

  /// only happens on reorgs
  static Future<void> remove(VoutRecord vout) async =>
      await domain.unspents.removeAll(DomainUnspent.from(
        vout,
        Protocols.ravencoinMainnet,
      ));
  /*
*/
}
