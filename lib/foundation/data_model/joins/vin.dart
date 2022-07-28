import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

extension VinRHasOneTransactionDeviceRecord on VinDeviceRecord {
  TransactionDeviceRecord? get transaction =>
      cache.transactions.byHash.getOne(transactionHash);
}

extension VinRHasOneVoutDeviceRecord on VinDeviceRecord {
  VoutDeviceRecord? get vout =>
      voutTransactionHash == null || voutPosition == null
          ? null
          : cache.vouts.byId.getOne(voutTransactionHash!, voutPosition!);
}
