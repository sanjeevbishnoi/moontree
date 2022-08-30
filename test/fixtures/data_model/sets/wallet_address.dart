import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/utils/derivation.dart';

import 'sets.dart';

class WalletWithAddress extends EmptySet {
  static final mnemonic =
      'strike faint hockey bean average crazy carry spatial hammer glow sorry fiscal';
  static final wallet = WalletDeviceRecord(
    pubkey:
        '03995ebd7d84f6c435391035f45a44cf6bd1d8c0ac627233706d0b0ad0f49a2c6d',
    derivation: "m/44'/175'/0'/0",
    name: 'name',
    mnemonic: mnemonic,
    privkey: '4a72457e41c65f084a798649c3918dd76744baff6023bd3b0f5878fc01c45a7c',
  );
  static final address = generateAddressRecord(
    wallet: wallet,
    index: 0,
    used: false,
  );
  static final walletAddress = WalletAddressDeviceRecord(
    address: address.id,
    pubkey: wallet.pubkey,
    derivation: wallet.derivation,
  );

  @override
  Map<String, AddressDeviceRecord> get addresses => {address.id: address};

  @override
  Map<String, WalletAddressDeviceRecord> get walletsAddresses =>
      {walletAddress.id: walletAddress};

  @override
  Map<String, WalletDeviceRecord> get wallets => {wallet.id: wallet};
}
