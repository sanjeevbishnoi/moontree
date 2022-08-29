import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension ABHaveAnAsset on AddressBalanceDeviceRecord {
  AssetDeviceRecord? get asset => data.assets.bySymbol.getOne(symbol);
}

extension ABHaveAnAddress on AddressBalanceDeviceRecord {
  AddressDeviceRecord? get ofAddress =>
      data.addresses.byAddress.getOne(this.address);
}
