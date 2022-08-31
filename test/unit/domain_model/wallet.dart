// ignore_for_file: avoid_print

//import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:moontree/foundation/triggers/wallet.dart' show ToWalletDomain;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

import '../../fixtures/data_model/sets/wallet_address.dart';
import '../../fixtures/domain_model/fixtures.dart';

void main() {
  group('wallet', () {
    final wallet = WalletWithAddress.wallet;
    setUp(() {});
    test('data_model wallet to domain_wallet with given derivation', () async {
      useFixture();
      final call = () => domain.wallets.byWallet.getOne(wallet.pubkey);
      expect(call(), isNull);
      await ToWalletDomain.load(wallet);
      expect(call(), isNotNull);
      expect(call()!.derivation, isNull);
    });
    test('data_model wallet to domain_wallet without given derivation',
        () async {
      useFixture();
      final walletCustom = WalletDeviceRecord(
        pubkey: wallet.pubkey,
        derivation: "m/44'/0",
        name: wallet.name,
        mnemonic: wallet.mnemonic,
        privkey: wallet.privkey,
      );
      final call = () => domain.wallets.byWallet.getOne(walletCustom.pubkey);
      expect(call(), isNull);
      await ToWalletDomain.load(walletCustom);
      expect(call(), isNotNull);
      expect(call()!.derivation, walletCustom.derivation);
    });
  });
}
