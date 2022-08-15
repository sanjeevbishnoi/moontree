import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

extension TRHasManyVinDeviceRecords on TransactionDeviceRecord {
  List<VinDeviceRecord> get vins => cache.vins.byTransactionHash.getAll(hash);
}

extension TRHasManyVoutDeviceRecords on TransactionDeviceRecord {
  List<VoutDeviceRecord> get vouts =>
      cache.vouts.byTransactionHash.getAll(hash);
}
