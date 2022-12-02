import 'package:proclaim/change.dart';
import 'package:moontree_utils/trigger.dart';
import 'package:moontree/foundation/domain_model/records/wallet.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class ToWalletDomain extends Trigger {
  void init() => when(
      thereIsA: data.wallets.changes,
      andIf: null,
      doThis: (Change<WalletRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) {}, // never remove
          ));

  /// puts the record into memory
  static Future<void> load(WalletRecord wallet) async =>
      await domain.wallets.save(DomainWallet.from(wallet));

  /// does not happen on wallets: just an example:
  /// only happens on reorgs
  //Future<void> remove(WalletRecord wallet) async =>
  //    await domain.wallets.remove(DomainWallet.from(
  //      wallet,
  //      // ??
  //      // we derive addresses on device so we should have this data at that time
  //      //  String hashedEntropy,
  //      //  String privkey,
  //      //  String receiveAddress, // should we remove this?
  //    ));
}
