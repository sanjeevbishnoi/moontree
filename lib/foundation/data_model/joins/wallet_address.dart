import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

extension WARHasOneAddressDeviceRecord on WalletAddressDeviceRecord {
  AddressDeviceRecord? get address => cache.addresses.byId.getOne(this.address);
}

extension WRHasOneWalletDeviceRecord on WalletAddressDeviceRecord {
  WalletDeviceRecord? get wallet =>
      cache.wallets.byId.getOne(pubkey, derivation);
}
