import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/joins/transaction.dart';
import 'package:moontree/foundation/data_model/joins/vout.dart';

extension VinRHasOneTransactionDeviceRecord on VinDeviceRecord {
  /// this should only fail if the transaction isn't downloaded yet.
  /// but we shouldn't have any triggers on vins downloaded,
  /// we should only have triggers on transactions downloaded,
  /// and they should happen last.
  TransactionDeviceRecord get transaction =>
      data.transactions.byHash.getOne(transactionHash)!;
}

extension VinRHasOneVoutDeviceRecord on VinDeviceRecord {
  VoutDeviceRecord? get vout =>
      voutTransactionHash == null || voutPosition == null
          ? null // coinbase
          : data.vouts.byId.getOne(voutTransactionHash!, voutPosition!);
}

extension VinRHasOneAssetDeviceRecord on VinDeviceRecord {
  String get symbol => voutTransactionHash == null || voutPosition == null
      ? 'RVN'
      : vout!.symbol;
  AssetDeviceRecord get asset => data.assets.bySymbol.getOne(symbol)!;
}

extension VinRHasSatsDeviceRecord on VinDeviceRecord {
  /// I believe coinbase transactions have only one vin and one vout.
  int get sats => vout?.sats ?? transaction.vouts.first.sats;
}

extension VinRHasAddressDeviceRecord on VinDeviceRecord {
  AddressDeviceRecord? get address => vout?.toAddress;
}
