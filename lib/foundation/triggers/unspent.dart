import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain/records/unspent.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;
import 'package:moontree/foundation/domain/proclaim/proclaim.dart' as domain;

class ToUnspentDomain extends Trigger {
  /*
  void init() => when(
      thereIsA: datamodel.transactions.changes,
      andIf: null,
      doThis: (Change<UnspentDeviceRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) => remove(removed.record),
          ));

  /// puts the record into memory
  Future<void> load(UnspentDeviceRecord transaction) async =>
      await domain.transactions.save(DomainUnspent.from(
        transaction,
        Protocol.ravencoinMainnet,
      ));

  /// only happens on reorgs
  Future<void> remove(UnspentDeviceRecord transaction) async =>
      await domain.transactions.remove(DomainUnspent.from(
        transaction,
        Protocol.ravencoinMainnet,
      ));
*/
}
