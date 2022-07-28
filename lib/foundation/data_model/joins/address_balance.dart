import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

extension ABHaveAnAsset on AddressBalanceDeviceRecord {
  AssetDeviceRecord? get asset => cache.assets.bySymbol.getOne(symbol);
}

extension ABHaveAnAddress on AddressBalanceDeviceRecord {
  AddressDeviceRecord? get address =>
      cache.addresses.byAddress.getOne(this.address);
}
