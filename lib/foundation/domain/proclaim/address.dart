import 'package:collection/collection.dart';
import 'package:moontree/foundation/domain/records/address.dart';
import 'package:proclaim/proclaim.dart';

part 'address.keys.dart';

class AddressProclaim extends Proclaim<_AddressKey, DomainAddress> {
  late IndexMultiple<_IdKey, DomainAddress> byId;
  late IndexMultiple<_AddressKey, DomainAddress> byAddress;

  AddressProclaim() : super(_AddressKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byAddress = addIndexMultiple('address', _AddressKey());
  }
}
