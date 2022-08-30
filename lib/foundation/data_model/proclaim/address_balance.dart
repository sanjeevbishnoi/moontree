import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'address_balance.keys.dart';

class AddressBalanceProclaim
    extends Proclaim<_IdKey, AddressBalanceDeviceRecord> {
  late IndexMultiple<_IdKey, AddressBalanceDeviceRecord> byId;
  late IndexMultiple<_AddressKey, AddressBalanceDeviceRecord> byAddress;
  late IndexMultiple<_SymbolKey, AddressBalanceDeviceRecord> bySymbol;

  AddressBalanceProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byAddress = addIndexMultiple('address', _AddressKey());
    bySymbol = addIndexMultiple('symbol', _SymbolKey());
  }

  static Map<String, AddressBalanceDeviceRecord> get defaults => {};

  Set<String> get ids => records.map((e) => e.id).toSet();

  Iterable<AddressBalanceDeviceRecord> byAddressAndLessThanHeight(
    String address,
    int height,
  ) =>
      byAddress
          .getAll(address)
          .where((e) => e.height != null && e.height! < height);

  Iterable<AddressBalanceDeviceRecord> byHeightGreaterThan(int height) =>
      records.where((e) => e.height != null && e.height! > height);
}
