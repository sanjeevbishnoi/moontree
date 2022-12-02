import 'package:collection/collection.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:proclaim/proclaim.dart';

part 'address.keys.dart';

class AddressProclaim extends Proclaim<_AddressKey, AddressRecord> {
  late IndexMultiple<_AddressKey, AddressRecord> byId;
  late IndexMultiple<_AddressKey, AddressRecord> byAddress;
  //used
  //index

  AddressProclaim() : super(_AddressKey()) {
    byAddress = addIndexMultiple('address', _AddressKey());
    byId = byAddress;
  }

  static Map<String, AddressRecord> get defaults => {};

  Set<String> get ids => records.map((e) => e.id).toSet();
}
