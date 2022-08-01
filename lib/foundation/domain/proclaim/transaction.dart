import 'package:collection/collection.dart';
import 'package:moontree/foundation/domain/records/asset.dart';
import 'package:moontree/foundation/domain/records/wallet.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain/records/transaction.dart';
import 'package:proclaim/proclaim.dart';

part 'transaction.keys.dart';

class TransactionProclaim extends Proclaim<_IdKey, DomainTransaction> {
  late IndexMultiple<_IdKey, DomainTransaction> byId;
  late IndexMultiple<_WalletIdKey, DomainTransaction> byWallet;
  late IndexMultiple<_AssetIdKey, DomainTransaction> byAsset;
  late IndexMultiple<_WalletAssetIdKey, DomainTransaction> byWalletAsset;

  TransactionProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byWallet = addIndexMultiple('wallet', _WalletIdKey());
    byAsset = addIndexMultiple('asset', _AssetIdKey());
    byWalletAsset = addIndexMultiple('walletasset', _WalletAssetIdKey());
  }

  static Map<String, DomainTransaction> get defaults => {};
}
