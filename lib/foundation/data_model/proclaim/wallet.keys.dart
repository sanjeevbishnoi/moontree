part of 'wallet.dart';

/// byPubkey

class _PubKey extends Key<WalletRecord> {
  @override
  String getKey(WalletRecord wallet) => wallet.pubkey;
}

extension ByPubKeyMethodsForWallet on IndexMultiple<_PubKey, WalletRecord> {
  WalletRecord? getOne(String pubkey) => getByKeyStr(pubkey).firstOrNull;
}

/// byId - primary key

class _IdKey extends Key<WalletRecord> {
  @override
  String getKey(WalletRecord wallet) => wallet.id;
}

extension ByIdMethodsForWallet on Index<_IdKey, WalletRecord> {
  WalletRecord? getOne(String pubkey, String derivation) =>
      getByKeyStr(WalletRecord.generateId(pubkey, derivation)).firstOrNull;
}

/// byDerivation

class _DerivationKey extends Key<WalletRecord> {
  @override
  String getKey(WalletRecord wallet) => wallet.derivation.toString();
}

extension ByDerivationMethodsForWallet on Index<_DerivationKey, WalletRecord> {
  List<WalletRecord> getAll(int derivationId) =>
      getByKeyStr(derivationId.toString());
}
