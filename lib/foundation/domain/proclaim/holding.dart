import 'package:collection/collection.dart';
import 'package:moontree/foundation/domain/records/asset.dart';
import 'package:moontree/foundation/domain/records/wallet.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain/records/holding.dart';
import 'package:proclaim/proclaim.dart';

part 'holding.keys.dart';

class HoldingProclaim extends Proclaim<_IdKey, DomainHolding> {
  late IndexMultiple<_IdKey, DomainHolding> byId;
  late IndexMultiple<_WalletIdKey, DomainHolding> byWallet;
  late IndexMultiple<_AssetIdKey, DomainHolding> byAsset;

  HoldingProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byWallet = addIndexMultiple('wallet', _WalletIdKey());
    byAsset = addIndexMultiple('asset', _AssetIdKey());
  }

  static Map<String, DomainHolding> get defaults => {
        // unable to connect to wallet means we shouldn't use this as default.
        //'RVN': DomainHolding(
        //   symbol: 'RVN',
        //   protocol: Protocol.ravencoinMainnet,
        //   sats: 0,
        //   pub: '',
        //   derivation: '',
        //  )
      };
}
