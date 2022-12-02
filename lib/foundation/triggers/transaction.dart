import 'package:proclaim/change.dart';
import 'package:moontree_utils/moontree_utils.dart' show Trigger;
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
      doThis: (Change<TransactionRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) => remove(removed.record),
          ));

  /// puts the record into memory
  static Future<void> load(TransactionRecord transaction) async =>
      await domain.transactions.saveAll(DomainTransaction.from(
        transaction,
        Protocols.ravencoinMainnet,
      ));

  /// only happens on reorgs
  static Future<void> remove(TransactionRecord transaction) async =>
      await domain.transactions.removeAll(DomainTransaction.from(
        transaction,
        Protocols.ravencoinMainnet,
      ));
}
