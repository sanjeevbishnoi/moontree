import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'transaction.keys.dart';

class TransactionProclaim extends Proclaim<_HashKey, TransactionRecord> {
  late IndexMultiple<_HashKey, TransactionRecord> byId;
  late IndexMultiple<_HashKey, TransactionRecord> byHash;
  late IndexMultiple<_HeightKey, TransactionRecord> byHeight;

  TransactionProclaim() : super(_HashKey()) {
    byHash = addIndexMultiple('hash', _HashKey());
    byHeight = addIndexMultiple('height', _HeightKey());
    byId = byHash;
  }

  static Map<String, TransactionRecord> get defaults => {};

  Set<String> get ids => records.map((e) => e.id).toSet();

  Iterable<TransactionRecord> byHeightGreaterThan(int height) =>
      records.where((e) => e.height != null && e.height! > height);
}
