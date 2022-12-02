import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'address_balance.keys.dart';

class AddressBalanceProclaim extends Proclaim<_IdKey, AddressBalanceRecord> {
  late IndexMultiple<_IdKey, AddressBalanceRecord> byId;
  late IndexMultiple<_AddressKey, AddressBalanceRecord> byAddress;
  late IndexMultiple<_SymbolKey, AddressBalanceRecord> bySymbol;

  AddressBalanceProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byAddress = addIndexMultiple('address', _AddressKey());
    bySymbol = addIndexMultiple('symbol', _SymbolKey());
  }

  static Map<String, AddressBalanceRecord> get defaults => {};

  Set<String> get ids => records.map((e) => e.id).toSet();

  Iterable<AddressBalanceRecord> byAddressAndLessThanHeight(
    String address,
    int height,
  ) =>
      byAddress
          .getAll(address)
          .where((e) => e.height != null && e.height! < height);

  Iterable<AddressBalanceRecord> byHeightGreaterThan(int height) =>
      records.where((e) => e.height != null && e.height! > height);
}
