import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension VoutRHasOneTransactionRecord on VoutRecord {
  TransactionRecord? get transaction =>
      data.transactions.byHash.getOne(transactionHash);
}

extension VoutRHasOneVinRecord on VoutRecord {
  VinRecord? get vin => data.vins.byVout.getOne(transactionHash, position);
}

extension VoutRHasOneAddressRecord on VoutRecord {
  /// mempool records where the subscriber is present don't get assoicated
  /// with an address record, because the look up would usually be pointless.
  AddressRecord? get toAddress => data.addresses.byId.getOne(this.address);
}

extension VoutRHasOneAssetRecord on VoutRecord {
  AssetRecord? get asset => data.assets.bySymbol.getOne(symbol);
}
