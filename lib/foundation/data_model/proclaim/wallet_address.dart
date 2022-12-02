import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'wallet_address.keys.dart';

class WalletAddressProclaim extends Proclaim<_IdKey, WalletAddressRecord> {
  late IndexMultiple<_IdKey, WalletAddressRecord> byId;
  late IndexMultiple<_WalletKey, WalletAddressRecord> byWallet;
  late IndexMultiple<_AddressKey, WalletAddressRecord> byAddress;

  WalletAddressProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byWallet = addIndexMultiple('walletid', _WalletKey());
    byAddress = addIndexMultiple('addressid', _AddressKey());
  }

  static Map<String, WalletAddressRecord> get defaults => {};

  Set<String> get ids => records.map((w) => w.id).toSet();
}
