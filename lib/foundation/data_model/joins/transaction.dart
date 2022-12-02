import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/joins/vin.dart';

extension TRHasManyVinRecords on TransactionRecord {
  List<VinRecord> get vins => data.vins.byTransactionHash.getAll(hash);
}

extension TRHasManyRVNVinRecords on TransactionRecord {
  List<VinRecord> get rvnVins =>
      vins.where((vin) => vin.symbol == 'RVN').toList();
}

extension TRHasManyVoutRecords on TransactionRecord {
  List<VoutRecord> get vouts => data.vouts.byTransactionHash.getAll(hash);
}

extension TRHasManyRVNVoutRecords on TransactionRecord {
  List<VoutRecord> get rvnVouts =>
      vouts.where((vout) => vout.symbol == 'RVN').toList();
}
