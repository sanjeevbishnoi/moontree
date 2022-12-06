import 'package:wallet_utils/wallet_utils.dart' as validation;
import 'package:moontree/foundation/utils/structs.dart';

AssetType assetTypeOf(String symbol) {
  if (symbol.startsWith('#') && symbol.contains('/')) {
    return AssetType.qualifier; //sub
  }
  if (symbol.startsWith('#')) {
    return AssetType.qualifier;
  }
  if (symbol.startsWith('\$')) {
    return AssetType.restricted;
  }
  if (symbol.contains('#')) {
    return AssetType.nft;
  }
  if (symbol.contains('~')) {
    return AssetType.channel;
  }
  if (symbol.endsWith('!') && symbol.contains('/')) {
    return AssetType.admin; //sub
  }
  if (symbol.contains('/')) {
    return AssetType.main; //sub
  }
  if (symbol.endsWith('!')) {
    return AssetType.admin;
  }
  if (['RVN', 'RAVENCOIN'].contains(symbol)) {
    return AssetType.currency;
  }
  if (boolValidateFullName(symbol)) {
    return AssetType.main;
  }
  return AssetType.unknown;
}

bool boolValidateFullName(String name) {
  if (!validation.isAssetPath(name.toUpperCase()) &&
      !validation.isRavencoinPath(name.toUpperCase())) {
    return false;
  } else {
    return true;
  }
}
