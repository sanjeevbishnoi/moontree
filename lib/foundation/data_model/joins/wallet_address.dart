import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension WARHasOneAddressRecord on WalletAddressRecord {
  AddressRecord? get address => data.addresses.byId.getOne(this.address);
}

extension WRHasOneWalletRecord on WalletAddressRecord {
  WalletRecord? get wallet => data.wallets.byId.getOne(pubkey, derivation);
}
