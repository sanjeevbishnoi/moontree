part of 'wallet.dart';

/// byPubkey

class _PubKey extends Key<WalletDeviceRecord> {
  @override
  String getKey(WalletDeviceRecord wallet) => wallet.pubkey;
}

extension ByPubKeyMethodsForWallet
    on IndexMultiple<_PubKey, WalletDeviceRecord> {
  WalletDeviceRecord? getOne(String pubkey) => getByKeyStr(pubkey).firstOrNull;
}

/// byId - primary key

class _IdKey extends Key<WalletDeviceRecord> {
  @override
  String getKey(WalletDeviceRecord wallet) => wallet.id;
}

extension ByIdMethodsForWallet on Index<_IdKey, WalletDeviceRecord> {
  WalletDeviceRecord? getOne(String pubkey, String derivation) =>
      getByKeyStr(WalletDeviceRecord.generateId(pubkey, derivation))
          .firstOrNull;
}

/// byDerivation

class _DerivationKey extends Key<WalletDeviceRecord> {
  @override
  String getKey(WalletDeviceRecord wallet) => wallet.derivation.toString();
}

extension ByDerivationMethodsForWallet
    on Index<_DerivationKey, WalletDeviceRecord> {
  List<WalletDeviceRecord> getAll(int derivationId) =>
      getByKeyStr(derivationId.toString());
}
