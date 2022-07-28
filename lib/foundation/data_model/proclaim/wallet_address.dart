import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'wallet_address.keys.dart';

class WalletAddressProclaim
    extends Proclaim<_IdKey, WalletAddressDeviceRecord> {
  late IndexMultiple<_IdKey, WalletAddressDeviceRecord> byId;
  late IndexMultiple<_WalletKey, WalletAddressDeviceRecord> byWallet;
  late IndexMultiple<_AddressKey, WalletAddressDeviceRecord> byAddress;

  WalletAddressProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byWallet = addIndexMultiple('walletid', _WalletKey());
    byAddress = addIndexMultiple('addressid', _AddressKey());
  }

  Set<String> get ids => records.map((w) => w.id).toSet();
}
