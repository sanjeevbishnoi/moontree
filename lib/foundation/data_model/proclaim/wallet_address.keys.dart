part of 'wallet_address.dart';

/// byId

class _IdKey extends Key<WalletAddressRecord> {
  @override
  String getKey(WalletAddressRecord walletAddress) =>
      walletAddress.id.toString();
}

extension ByIdMethodsForWalletAddress on Index<_IdKey, WalletAddressRecord> {
  WalletAddressRecord? getOne(
          String pubkey, String derivation, String address) =>
      getByKeyStr(WalletAddressRecord.generateId(pubkey, derivation, address))
          .firstOrNull;
}

/// byWallet

class _WalletKey extends Key<WalletAddressRecord> {
  @override
  String getKey(WalletAddressRecord balance) => balance.walletId;
}

extension ByWalletKeyMethodsForWalletBalanceIncremental
    on IndexMultiple<_WalletKey, WalletAddressRecord> {
  List<WalletAddressRecord> getAll(String pubkey, String? derviation) =>
      getByKeyStr(WalletAddressRecord.generateWalletId(pubkey, derviation));
}

/// byAddress

class _AddressKey extends Key<WalletAddressRecord> {
  @override
  String getKey(WalletAddressRecord wallet) => wallet.address;
}

extension ByAddressMethodsForWalletAddress
    on Index<_AddressKey, WalletAddressRecord> {
  List<WalletAddressRecord> getAll(String address) => getByKeyStr(address);
}
