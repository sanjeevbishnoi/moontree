import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain_model/records/asset.dart';

part 'asset.keys.dart';

class AssetProclaim extends Proclaim<_IdKey, DomainAsset> {
  late IndexMultiple<_IdKey, DomainAsset> byId;
  late IndexMultiple<_IdKey, DomainAsset> bySymbolProtocol;
  late IndexMultiple<_SymbolKey, DomainAsset> bySymbol;
  late IndexMultiple<_ProtocolKey, DomainAsset> byProtocol;

  AssetProclaim() : super(_IdKey()) {
    bySymbol = addIndexMultiple('bySymbol', _SymbolKey());
    bySymbolProtocol = addIndexMultiple('bySymbolProtocol', _IdKey());
    byProtocol = addIndexMultiple('byProtocol', _ProtocolKey());
    byId = bySymbolProtocol;
  }

  static Map<String, DomainAsset> get defaults => {
        DomainAsset.generateId('RVN', Protocols.ravencoinMainnet): DomainAsset(
            assetType: AssetType.currency,
            protocol: Protocols.ravencoinMainnet,
            symbol: 'RVN',
            name: 'Ravencoin'),
        DomainAsset.generateId('RVN', Protocols.ravencoinTestnet): DomainAsset(
            assetType: AssetType.currency,
            protocol: Protocols.ravencoinTestnet,
            symbol: 'RVN',
            name: 'Ravencoin')
      };
}
