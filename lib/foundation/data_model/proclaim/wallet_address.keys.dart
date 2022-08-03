part of 'wallet_address.dart';

/// byId

class _IdKey extends Key<WalletAddressDeviceRecord> {
  @override
  String getKey(WalletAddressDeviceRecord walletAddress) =>
      walletAddress.id.toString();
}

extension ByIdMethodsForWalletAddress
    on Index<_IdKey, WalletAddressDeviceRecord> {
  WalletAddressDeviceRecord? getOne(
          String pubkey, String derivation, String address) =>
      getByKeyStr(
              WalletAddressDeviceRecord.generateId(pubkey, derivation, address))
          .firstOrNull;
}

/// byWallet

class _WalletKey extends Key<WalletAddressDeviceRecord> {
  @override
  String getKey(WalletAddressDeviceRecord balance) => balance.walletId;
}

extension ByWalletKeyMethodsForWalletBalanceIncremental
    on IndexMultiple<_WalletKey, WalletAddressDeviceRecord> {
  List<WalletAddressDeviceRecord> getAll(String pubkey, String? derviation) =>
      getByKeyStr(
          WalletAddressDeviceRecord.generateWalletId(pubkey, derviation));
}

/// byAddress

class _AddressKey extends Key<WalletAddressDeviceRecord> {
  @override
  String getKey(WalletAddressDeviceRecord wallet) => wallet.address;
}

extension ByAddressMethodsForWalletAddress
    on Index<_AddressKey, WalletAddressDeviceRecord> {
  List<WalletAddressDeviceRecord> getAll(String address) =>
      getByKeyStr(address);
}
