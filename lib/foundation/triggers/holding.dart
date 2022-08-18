import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
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
        thereIsA: data.walletBalances.changes,
        andIf: null,
        doThis: (Change<WalletBalanceDeviceRecord> change) async => change.when(
              loaded: (loaded) => load(loaded.record),
              added: (added) => load(added.record),
              updated: (updated) => load(updated.record),
              removed: (removed) => remove(removed.record),
            ));
  }

  /// puts the record into memory
  Future<void> load(WalletBalanceDeviceRecord balance) async =>
      await domain.holdings.save(DomainHolding.from(
        balance,
        Protocol.ravencoinMainnet,
      ));

  /// only happens on reorgs
  Future<void> remove(WalletBalanceDeviceRecord balance) async =>
      await domain.holdings.remove(DomainHolding.from(
        balance,
        Protocol.ravencoinMainnet,
      ));
}
