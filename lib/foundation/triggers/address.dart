import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/domain_model/records/address.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class ToAddressDomain extends Trigger {
  void init() => when(
      thereIsA: datamodel.addresses.changes,
      andIf: null,
      doThis: (Change<AddressDeviceRecord> change) async => change.when(
            loaded: (loaded) => load(loaded.record),
            added: (added) => load(added.record),
            updated: (updated) => load(updated.record),
            removed: (removed) => remove(removed.record),
          ));

  /// puts the record into memory
  Future<void> load(AddressDeviceRecord address) async =>
      await domain.addresses.save(DomainAddress.from(
        address,
        // ??
        // we derive addresses on device so we should have this data at that time
        //  String privkey,
        //  String pubkey,
        //  String walletPub,
        //  String walletDerivation,
      ));

  /// only happens on reorgs
  Future<void> remove(AddressDeviceRecord address) async =>
      await domain.addresses.remove(DomainAddress.from(
        address,
        // ??
        // we derive addresses on device so we should have this data at that time
        //  String privkey,
        //  String pubkey,
        //  String walletPub,
        //  String walletDerivation,
      ));
}
