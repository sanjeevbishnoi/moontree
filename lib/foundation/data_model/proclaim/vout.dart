import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'vout.keys.dart';

class VoutProclaim extends Proclaim<_TxVoutKey, VoutRecord> {
  late IndexMultiple<_TxVoutKey, VoutRecord> byId;
  late IndexMultiple<_TxVoutKey, VoutRecord> byTransactionPosition;
  late IndexMultiple<_TxHashKey, VoutRecord> byTransactionHash;
  late IndexMultiple<_SymbolKey, VoutRecord> bySymbol;
  late IndexMultiple<_AddressKey, VoutRecord> byAddress;

  VoutProclaim() : super(_TxVoutKey()) {
    byTransactionPosition = addIndexMultiple('txhashposition', _TxVoutKey());
    byTransactionHash = addIndexMultiple('txhash', _TxHashKey());
    bySymbol = addIndexMultiple('symbol', _SymbolKey());
    byAddress = addIndexMultiple('address', _AddressKey());
    byId = byTransactionPosition;
  }

  static Map<String, VoutRecord> get defaults => {};

  Set<String> get ids => records.map((e) => e.id).toSet();
}
