import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain_model/records/holding.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

// working example where tranlsation happens here.
class ToHoldingDomain extends Trigger {
  void init() {
    /// takes precedence
    when(
        thereIsA: datamodel.walletBalances.changes,
        andIf: null,
        doThis: (Change<WalletBalanceDeviceRecord> change) async => change.when(
              loaded: (loaded) => load(loaded.record),
              added: (added) => load(added.record),
              updated: (updated) => load(updated.record),
              removed: (removed) => remove(removed.record),
            ));

    /// the first time we ask for balances, the server will give us a list of
    /// address balances first, because it can get to it more quickly. so, we
    /// get them all at once, which is why we listen to the batchedChanges, then
    /// we aggregate them by asset and produce holdings from them. when wallet
    /// holdings appear we'll remove the ones generated from this process.
    //when(
    //    thereIsA: datamodel.addressBalances.batchedChanges,
    //    andIf: (_) => datamodel.walletBalances.records.isEmpty,
    //    doThis: (List<Change<AddressBalanceDeviceRecord>> change) async => change.when(
    //          // TODO: aggregate and load holdings by asset:
    //          loaded: (loaded) => loadAddressBalances(loaded.record),
    //          added: (added) => loadAddressBalances(added.record),
    //          updated: (updated) => loadAddressBalances(updated.record),
    //          removed: (removed) => removeAddressBalances(removed.record),
    //        ));
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
