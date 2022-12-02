import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/joins/transaction.dart';
import 'package:moontree/foundation/data_model/joins/vout.dart';

extension VinRHasOneTransactionRecord on VinRecord {
  /// this should only fail if the transaction isn't downloaded yet.
  /// but we shouldn't have any triggers on vins downloaded,
  /// we should only have triggers on transactions downloaded,
  /// and they should happen last.
  TransactionRecord get transaction =>
      data.transactions.byHash.getOne(transactionHash)!;
}

extension VinRHasOneVoutRecord on VinRecord {
  VoutRecord? get vout => voutTransactionHash == null || voutPosition == null
      ? null // coinbase
      : data.vouts.byId.getOne(voutTransactionHash!, voutPosition!);
}

extension VinRHasOneAssetRecord on VinRecord {
  String get symbol => voutTransactionHash == null || voutPosition == null
      ? 'RVN'
      : vout!.symbol;
  AssetRecord get asset => data.assets.bySymbol.getOne(symbol)!;
}

extension VinRHasSatsRecord on VinRecord {
  /// I believe coinbase transactions have only one vin and one vout.
  int get sats => vout?.sats ?? transaction.vouts.first.sats;
}

extension VinRHasAddressRecord on VinRecord {
  AddressRecord? get address => vout?.toAddress;
}
