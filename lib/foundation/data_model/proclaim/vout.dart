import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'vout.keys.dart';

class VoutProclaim extends Proclaim<_TxVoutKey, VoutDeviceRecord> {
  late IndexMultiple<_TxVoutKey, VoutDeviceRecord> byId;
  late IndexMultiple<_TxVoutKey, VoutDeviceRecord> byTransactionPosition;
  late IndexMultiple<_TxHashKey, VoutDeviceRecord> byTransactionHash;
  late IndexMultiple<_SymbolKey, VoutDeviceRecord> bySymbol;
  late IndexMultiple<_AddressKey, VoutDeviceRecord> byAddress;

  VoutProclaim() : super(_TxVoutKey()) {
    byTransactionPosition = addIndexMultiple('txhashposition', _TxVoutKey());
    byTransactionHash = addIndexMultiple('txhash', _TxHashKey());
    bySymbol = addIndexMultiple('symbol', _SymbolKey());
    byAddress = addIndexMultiple('address', _AddressKey());
    byId = byTransactionPosition;
  }

  Set<String> get ids => records.map((e) => e.id).toSet();
}
