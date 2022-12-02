import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'vin.keys.dart';

class VinProclaim extends Proclaim<_IdKey, VinRecord> {
  late IndexMultiple<_IdKey, VinRecord> byId;
  late IndexMultiple<_VoutKey, VinRecord> byVout;
  late IndexMultiple<_TxHashKey, VinRecord> byTransactionHash;
  late IndexMultiple<_CoinbaseKey, VinRecord> byCoinbase;

  VinProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byVout = addIndexMultiple('voutid', _VoutKey());
    byTransactionHash = addIndexMultiple('txhash', _TxHashKey());
    byCoinbase = addIndexMultiple('coinbase', _CoinbaseKey());
  }

  static Map<String, VinRecord> get defaults => {};

  Set<String> get ids => records.map((e) => e.id).toSet();
}
