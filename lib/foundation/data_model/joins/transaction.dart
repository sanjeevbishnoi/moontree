import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension TRHasManyVinDeviceRecords on TransactionDeviceRecord {
  List<VinDeviceRecord> get vins => data.vins.byTransactionHash.getAll(hash);
}

extension TRHasManyVoutDeviceRecords on TransactionDeviceRecord {
  List<VoutDeviceRecord> get vouts => data.vouts.byTransactionHash.getAll(hash);
}
