import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/domain_model/records/address.dart';
import 'package:moontree/foundation/domain_model/records/wallet.dart';

part 'address.keys.dart';

class AddressProclaim extends Proclaim<_IdKey, DomainAddress> {
  late IndexMultiple<_IdKey, DomainAddress> byId;
  late IndexMultiple<_IdKey, DomainAddress> byAddress;
  late IndexMultiple<_WalletIdKey, DomainAddress> byWallet;

  AddressProclaim() : super(_IdKey()) {
    byAddress = addIndexMultiple('address', _IdKey());
    byWallet = addIndexMultiple('wallet', _WalletIdKey());
    byId = byAddress;
  }

  static Map<String, DomainAddress> get defaults => {};
}
