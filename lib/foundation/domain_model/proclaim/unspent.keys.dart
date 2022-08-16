part of 'unspent.dart';

// primary key - byId

class _IdKey extends Key<DomainUnspent> {
  @override
  String getKey(DomainUnspent holding) => holding.id;
}

extension ByIdMethodsForDomainUnspent on Index<_IdKey, DomainUnspent> {
  DomainUnspent? getOne(
    String transactionHash,
    int position,
    Protocol protocol,
  ) =>
      getByKeyStr(DomainUnspent.generateId(transactionHash, position, protocol))
          .firstOrNull;
}

// Asset

class _AssetIdKey extends Key<DomainUnspent> {
  @override
  String getKey(DomainUnspent holding) => holding.assetId;
}

extension ByAssetIdMethodsForDomainUnspent
    on Index<_AssetIdKey, DomainUnspent> {
  List<DomainUnspent> getAll(String symbol, Protocol protocol) =>
      getByKeyStr(DomainAsset.generateId(symbol, protocol));
}

// Address

class _AddressKey extends Key<DomainUnspent> {
  @override
  String getKey(DomainUnspent holding) => holding.address;
}

extension ByAddressMethodsForDomainUnspent
    on Index<_AddressKey, DomainUnspent> {
  List<DomainUnspent> getAll(String address) => getByKeyStr(address);
}

// Wallet

class _WalletIdKey extends Key<DomainUnspent> {
  @override
  String getKey(DomainUnspent holding) => holding.walletId;
}

extension ByWalletIdMethodsForDomainUnspent
    on Index<_WalletIdKey, DomainUnspent> {
  List<DomainUnspent> getAll(String sub) =>
      getByKeyStr(DomainWallet.generateId(sub));
}
