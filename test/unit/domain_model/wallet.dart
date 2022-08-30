// ignore_for_file: avoid_print

//import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:moontree/foundation/triggers/wallet.dart' show ToWalletDomain;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

import '../../fixtures/domain_model/fixtures.dart';

void main() {
  group('wallet', () {
    final mnemonic =
        'strike faint hockey bean average crazy carry spatial hammer glow sorry fiscal';
    setUp(() {});
    test('data_model wallet to domain_wallet with given derivation', () async {
      useFixture();
      final wallet = WalletDeviceRecord(
        pubkey:
            '03995ebd7d84f6c435391035f45a44cf6bd1d8c0ac627233706d0b0ad0f49a2c6d',
        derivation: "m/44'/175'/0'/0",
        name: 'name',
        mnemonic: mnemonic,
        privkey:
            '4a72457e41c65f084a798649c3918dd76744baff6023bd3b0f5878fc01c45a7c',
      );
      expect(domain.wallets.byWallet.getOne(wallet.pubkey), isNull);
      await ToWalletDomain.load(wallet);
      expect(domain.wallets.byWallet.getOne(wallet.pubkey), isNotNull);
      expect(domain.wallets.byWallet.getOne(wallet.pubkey)!.derivation, isNull);
    });
    test('data_model wallet to domain_wallet without given derivation',
        () async {
      useFixture();
      final walletCustom = WalletDeviceRecord(
        pubkey:
            '03995ebd7d84f6c435391035f45a44cf6bd1d8c0ac627233706d0b0ad0f49a2c6d',
        derivation: "m/44'/0",
        name: 'name',
        mnemonic: mnemonic,
        privkey:
            '4a72457e41c65f084a798649c3918dd76744baff6023bd3b0f5878fc01c45a7c',
      );
      expect(domain.wallets.byWallet.getOne(walletCustom.pubkey), isNull);
      await ToWalletDomain.load(walletCustom);
      expect(domain.wallets.byWallet.getOne(walletCustom.pubkey), isNotNull);
      expect(domain.wallets.byWallet.getOne(walletCustom.pubkey)!.derivation,
          walletCustom.derivation);
    });
  });
}
