import 'package:moontree/foundation/data_model/joins/joins.dart';
import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/domain_model/records/address.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class ToAddressDomain extends Trigger {
  void init() => when(
      thereIsA: data.addresses.changes,
      andIf: null,
      doThis: (Change<AddressDeviceRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) {}, // never remove
          ));

  /// puts the record into memory
  Future<void> load(AddressDeviceRecord address) async => address.wallets
      .forEach((wallet) async => await domain.addresses.save(DomainAddress.from(
            address,
            walletPub: wallet.pubkey,
          )));
}
