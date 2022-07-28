import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'transaction.keys.dart';

class TransactionProclaim extends Proclaim<_HashKey, TransactionDeviceRecord> {
  late IndexMultiple<_HashKey, TransactionDeviceRecord> byId;
  late IndexMultiple<_HashKey, TransactionDeviceRecord> byHash;
  late IndexMultiple<_HeightKey, TransactionDeviceRecord> byHeight;

  TransactionProclaim() : super(_HashKey()) {
    byHash = addIndexMultiple('hash', _HashKey());
    byHeight = addIndexMultiple('height', _HeightKey());
    byId = byHash;
  }

  Set<String> get ids => records.map((e) => e.id).toSet();
}
