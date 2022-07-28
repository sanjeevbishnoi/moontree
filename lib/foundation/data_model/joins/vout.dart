import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

extension VoutRHasOneTransactionDeviceRecord on VoutDeviceRecord {
  TransactionDeviceRecord? get transaction =>
      cache.transactions.byHash.getOne(transactionHash);
}

extension VoutRHasOneVinDeviceRecord on VoutDeviceRecord {
  VinDeviceRecord? get vin =>
      cache.vins.byVout.getOne(transactionHash, position);
}

extension VoutRHasOneAddressDeviceRecord on VoutDeviceRecord {
  /// mempool records where the subscriber is present don't get assoicated
  /// with an address record, because the look up would usually be pointless.
  AddressDeviceRecord? get address => cache.addresses.byId.getOne(this.address);
}

extension VoutRHasOneAssetDeviceRecord on VoutDeviceRecord {
  AssetDeviceRecord? get asset => cache.assets.bySymbol.getOne(symbol);
}
