import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension VinRHasOneTransactionDeviceRecord on VinDeviceRecord {
  TransactionDeviceRecord? get transaction =>
      data.transactions.byHash.getOne(transactionHash);
}

extension VinRHasOneVoutDeviceRecord on VinDeviceRecord {
  VoutDeviceRecord? get vout =>
      voutTransactionHash == null || voutPosition == null
          ? null
          : data.vouts.byId.getOne(voutTransactionHash!, voutPosition!);
}
