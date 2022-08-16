part of 'transaction.dart';

// primary key - byId

class _IdKey extends Key<DomainTransaction> {
  @override
  String getKey(DomainTransaction transaction) => transaction.id;
}

extension ByIdMethodsForDomainTransaction on Index<_IdKey, DomainTransaction> {
  DomainTransaction? getOne(
    String transactionHash,
    String symbol,
    Protocol protocol,
    String pub,
  ) =>
      getByKeyStr(DomainTransaction.generateId(
              transactionHash, symbol, protocol, pub))
          .firstOrNull;
}

// Asset

class _AssetIdKey extends Key<DomainTransaction> {
  @override
  String getKey(DomainTransaction transaction) => transaction.assetId;
}

extension ByAssetIdMethodsForDomainTransaction
    on Index<_AssetIdKey, DomainTransaction> {
  List<DomainTransaction> getAll(String symbol, Protocol protocol) =>
      getByKeyStr(DomainAsset.generateId(symbol, protocol));
}

// Wallet

class _WalletIdKey extends Key<DomainTransaction> {
  @override
  String getKey(DomainTransaction transaction) => transaction.walletId;
}

extension ByWalletIdMethodsForDomainTransaction
    on Index<_WalletIdKey, DomainTransaction> {
  List<DomainTransaction> getAll(String pub) =>
      getByKeyStr(DomainWallet.generateId(pub));
}

// WalletAsset

class _WalletAssetIdKey extends Key<DomainTransaction> {
  @override
  String getKey(DomainTransaction transaction) => transaction.walletAssetId;
}

extension ByWalletAssetIdMethodsForDomainTransaction
    on Index<_WalletAssetIdKey, DomainTransaction> {
  List<DomainTransaction> getAll(
          String pub, String symbol, Protocol protocol) =>
      getByKeyStr(
          DomainTransaction.generateWalletAssetId(pub, symbol, protocol));
}
