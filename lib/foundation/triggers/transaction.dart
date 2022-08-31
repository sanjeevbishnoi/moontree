import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/domain_model/records/transaction.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class ToTransactionDomain extends Trigger {
  void init() => when(
      thereIsA: data.transactions.changes,
      andIf: null,
      doThis: (Change<TransactionDeviceRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) => remove(removed.record),
          ));

  /// puts the record into memory
  static Future<void> load(TransactionDeviceRecord transaction) async =>
      await domain.transactions.saveAll(DomainTransaction.from(
        transaction,
        Protocol.ravencoinMainnet,
      ));

  /// only happens on reorgs
  static Future<void> remove(TransactionDeviceRecord transaction) async =>
      await domain.transactions.removeAll(DomainTransaction.from(
        transaction,
        Protocol.ravencoinMainnet,
      ));
}
