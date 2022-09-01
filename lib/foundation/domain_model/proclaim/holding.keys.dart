part of 'holding.dart';

// primary key - byId

class _IdKey extends Key<DomainHolding> {
  @override
  String getKey(DomainHolding holding) => holding.id;
}

extension ByIdMethodsForDomainHolding on Index<_IdKey, DomainHolding> {
  DomainHolding? getOne(
    String symbol,
    Protocols protocol,
    String pub,
  ) =>
      getByKeyStr(DomainHolding.generateId(symbol, protocol, pub)).firstOrNull;
}

// Asset

class _AssetIdKey extends Key<DomainHolding> {
  @override
  String getKey(DomainHolding holding) => holding.assetId;
}

extension ByAssetIdMethodsForDomainHolding
    on Index<_AssetIdKey, DomainHolding> {
  List<DomainHolding> getAll(String symbol, Protocols protocol) =>
      getByKeyStr(DomainAsset.generateId(symbol, protocol));
}

// Wallet

class _WalletIdKey extends Key<DomainHolding> {
  @override
  String getKey(DomainHolding holding) => holding.walletId;
}

extension ByWalletIdMethodsForDomainHolding
    on Index<_WalletIdKey, DomainHolding> {
  List<DomainHolding> getAll(String pub) =>
      getByKeyStr(DomainWallet.generateId(pub));
}
