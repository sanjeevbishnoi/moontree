import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'vin.keys.dart';

class VinProclaim extends Proclaim<_IdKey, VinDeviceRecord> {
  late IndexMultiple<_IdKey, VinDeviceRecord> byId;
  late IndexMultiple<_VoutKey, VinDeviceRecord> byVout;
  late IndexMultiple<_TxHashKey, VinDeviceRecord> byTransactionHash;
  late IndexMultiple<_CoinbaseKey, VinDeviceRecord> byCoinbase;

  VinProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byVout = addIndexMultiple('voutid', _VoutKey());
    byTransactionHash = addIndexMultiple('txhash', _TxHashKey());
    byCoinbase = addIndexMultiple('coinbase', _CoinbaseKey());
  }

  Set<String> get ids => records.map((e) => e.id).toSet();
}
