import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain_model/records/asset.dart';
import 'package:moontree/foundation/domain_model/records/wallet.dart';
import 'package:moontree/foundation/domain_model/records/unspent.dart';

part 'unspent.keys.dart';

class UnspentProclaim extends Proclaim<_IdKey, DomainUnspent> {
  late IndexMultiple<_IdKey, DomainUnspent> byId;
  late IndexMultiple<_AssetIdKey, DomainUnspent> byAsset;
  late IndexMultiple<_AddressKey, DomainUnspent> byAddress;
  late IndexMultiple<_WalletIdKey, DomainUnspent> byWallet;

  UnspentProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byAsset = addIndexMultiple('asset', _AssetIdKey());
    byAddress = addIndexMultiple('address', _AddressKey());
    byWallet = addIndexMultiple('wallet', _WalletIdKey());
  }

  static Map<String, DomainUnspent> get defaults => {};
}
