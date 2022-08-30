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

  static Map<String, TransactionDeviceRecord> get defaults => {};

  Set<String> get ids => records.map((e) => e.id).toSet();

  Iterable<TransactionDeviceRecord> byHeightGreaterThan(int height) =>
      records.where((e) => e.height != null && e.height! > height);
}
