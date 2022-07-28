import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'address_balance.keys.dart';

class AddressBalanceProclaim
    extends Proclaim<_IdKey, AddressBalanceDeviceRecord> {
  late IndexMultiple<_IdKey, AddressBalanceDeviceRecord> byId;
  late IndexMultiple<_AddressKey, AddressBalanceDeviceRecord> byAddress;

  AddressBalanceProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byAddress = addIndexMultiple('addressid', _AddressKey());
  }

  Set<String> get ids => records.map((e) => e.id).toSet();

  Iterable<AddressBalanceDeviceRecord> byAddressAndLessThanHeight(
    String address,
    int height,
  ) =>
      byAddress
          .getAll(address)
          .where((e) => e.height != null && e.height! < height);
}
