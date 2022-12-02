import 'package:moontree/foundation/data_model/records/records.dart';

import 'sets.dart';

class WalletOnly extends EmptySet {
  static final mnemonic =
      'strike faint hockey bean average crazy carry spatial hammer glow sorry fiscal';
  static final wallet = WalletRecord(
    pubkey:
        '03995ebd7d84f6c435391035f45a44cf6bd1d8c0ac627233706d0b0ad0f49a2c6d',
    derivation: "m/44'/175'/0'/0",
    name: 'name',
    mnemonic: mnemonic,
    privkey: '4a72457e41c65f084a798649c3918dd76744baff6023bd3b0f5878fc01c45a7c',
  );

  @override
  Map<String, WalletRecord> get wallets => {wallet.id: wallet};
}
