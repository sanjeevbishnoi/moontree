import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/domain_model/records/wallet.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class ToWalletDomain extends Trigger {
  void init() => when(
      thereIsA: datamodel.wallets.changes,
      andIf: null,
      doThis: (Change<WalletDeviceRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) => remove(removed.record),
          ));

  /// puts the record into memory
  Future<void> load(WalletDeviceRecord wallet) async =>
      await domain.wallets.save(DomainWallet.from(
        wallet,
        // ??
        // we derive addresses on device so we should have this data at that time
        //  String hashedEntropy,
        //  String privkey,
        //  String receiveAddress, // should we remove this?
      ));

  /// only happens on reorgs
  Future<void> remove(WalletDeviceRecord wallet) async =>
      await domain.wallets.remove(DomainWallet.from(
        wallet,
        // ??
        // we derive addresses on device so we should have this data at that time
        //  String hashedEntropy,
        //  String privkey,
        //  String receiveAddress, // should we remove this?
      ));
}
