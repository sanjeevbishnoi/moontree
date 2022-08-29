import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/joins/vin.dart';

extension TRHasManyVinDeviceRecords on TransactionDeviceRecord {
  List<VinDeviceRecord> get vins => data.vins.byTransactionHash.getAll(hash);
}

extension TRHasManyRVNVinDeviceRecords on TransactionDeviceRecord {
  List<VinDeviceRecord> get rvnVins =>
      vins.where((vin) => vin.symbol == 'RVN').toList();
}

extension TRHasManyVoutDeviceRecords on TransactionDeviceRecord {
  List<VoutDeviceRecord> get vouts => data.vouts.byTransactionHash.getAll(hash);
}

extension TRHasManyRVNVoutDeviceRecords on TransactionDeviceRecord {
  List<VoutDeviceRecord> get rvnVouts =>
      vouts.where((vout) => vout.symbol == 'RVN').toList();
}
