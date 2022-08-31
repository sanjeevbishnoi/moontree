// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/utils/derivation.dart';
import 'package:moontree/foundation/services/derivation.dart'
    show DerivationProcessor;

import '../../fixtures/data_model/fixtures.dart';
import '../../fixtures/data_model/sets/wallet_address.dart';

void main() {
  group('wallet', () {
    final wallet = WalletWithAddress.wallet;
    final mnemonic = WalletWithAddress.mnemonic;
    setUp(() {});

    test('create data_model wallet', () async {
      expect(generateWalletRecord(name: 'name', mnemonic: mnemonic), wallet);
    });

    test('save data_model wallet', () async {
      useFixture();
      final call =
          () => data.wallets.byId.getOne(wallet.pubkey, wallet.derivation);
      expect(call(), isNull);
      await DerivationProcessor()
          .makeSaveWallet(wallet.name!, wallet.mnemonic!, wallet.derivation);
      expect(call(), wallet);
    });
  });
}
