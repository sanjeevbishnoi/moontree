import 'package:proclaim/change.dart';
import 'package:moontree_utils/moontree_utils.dart' show Trigger;
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain_model/records/holding.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

// working example where tranlsation happens here.
class ToHoldingDomain extends Trigger {
  void init() {
    /// takes precedence
    when(
        thereIsA: data.walletsBalances.changes,
        andIf: null,
        doThis: (Change<WalletBalanceRecord> change) async => change.when(
              loaded: (loaded) => load(loaded.record),
              added: (added) => load(added.record),
              updated: (updated) => load(updated.record),
              removed: (removed) => remove(removed.record),
            ));
  }

  /// puts the record into memory
  static Future<void> load(WalletBalanceRecord balance) async =>
      await domain.holdings.save(DomainHolding.from(
        balance,
        Protocols.ravencoinMainnet,
      ));

  /// only happens on reorgs
  static Future<void> remove(WalletBalanceRecord balance) async =>
      await domain.holdings.remove(DomainHolding.from(
        balance,
        Protocols.ravencoinMainnet,
      ));
}
