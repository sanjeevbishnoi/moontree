import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension ABHaveAnAsset on AddressBalanceRecord {
  AssetRecord? get asset => data.assets.bySymbol.getOne(symbol);
}

extension ABHaveAnAddress on AddressBalanceRecord {
  AddressRecord? get ofAddress => data.addresses.byAddress.getOne(this.address);
}
