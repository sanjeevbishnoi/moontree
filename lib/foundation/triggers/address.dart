import 'package:moontree/foundation/data_model/joins/joins.dart';
import 'package:proclaim/change.dart';
import 'package:moontree_utils/moontree_utils.dart' show Trigger;
import 'package:moontree/foundation/domain_model/records/address.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class ToAddressDomain extends Trigger {
  void init() => when(
      thereIsA: data.addresses.changes,
      andIf: null,
      doThis: (Change<AddressRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) {}, // never remove
          ));

  /// puts the record into memory
  static Future<void> load(AddressRecord address) async => address.wallets
      .forEach((wallet) async => domain.addresses.save(DomainAddress.from(
            address,
            walletPub: wallet.pubkey,
          )));
}
