import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension WARHasOneAddressDeviceRecord on WalletAddressDeviceRecord {
  AddressDeviceRecord? get address => data.addresses.byId.getOne(this.address);
}

extension WRHasOneWalletDeviceRecord on WalletAddressDeviceRecord {
  WalletDeviceRecord? get wallet =>
      data.wallets.byId.getOne(pubkey, derivation);
}
