// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/utils/derivation.dart';
import 'package:moontree/foundation/services/derivation.dart'
    show DerivationProcessor;

import '../../fixtures/data_model/fixtures.dart';

void main() {
  group('wallet', () {
    final mnemonic =
        'strike faint hockey bean average crazy carry spatial hammer glow sorry fiscal';
    final wallet = WalletDeviceRecord(
      pubkey:
          '03995ebd7d84f6c435391035f45a44cf6bd1d8c0ac627233706d0b0ad0f49a2c6d',
      derivation: "m/44'/175'/0'/0",
      name: 'name',
      mnemonic: mnemonic,
      privkey:
          '4a72457e41c65f084a798649c3918dd76744baff6023bd3b0f5878fc01c45a7c',
    );

    setUp(() {});

    test('create data_model wallet', () async {
      expect(generateWalletRecord(name: 'name', mnemonic: mnemonic), wallet);
    });

    test('save data_model wallet', () async {
      useFixture();
      expect(
          data.wallets.byId.getOne(wallet.pubkey, wallet.derivation), isNull);
      await DerivationProcessor()
          .makeSaveWallet(wallet.name!, wallet.mnemonic!, wallet.derivation);
      expect(
          data.wallets.byId.getOne(wallet.pubkey, wallet.derivation), wallet);
    });
  });
}
