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
    setUp(() {});
    test('data_model wallet to domain_wallet with given derivation', () async {
      useFixture();
      expect(domain.wallets.byWallet.getOne('pubkey'), isNull);
      //await ToWalletDomain.load(WalletDeviceRecord(
      //  pubkey: 'pubkey',
      //  derivation: 'derivation',
      //  name: 'name',
      //  mnemonic: 'mnemonic',
      //  privkey: 'privkey',
      //));
      //expect(domain.wallets.byWallet.getOne('pubkey'), isNotNull);
      //expect(
      //    domain.wallets.byWallet.getOne('pubkey')!.derivation, 'derivation');
    });
    test('data_model wallet to domain_wallet without given derivation',
        () async {
      useFixture();
      expect(domain.wallets.byWallet.getOne('pubkey'), isNull);
      //await ToWalletDomain.load(WalletDeviceRecord(
      //  pubkey: 'pubkey',
      //  name: 'name',
      //  mnemonic: 'mnemonic',
      //  privkey: 'privkey',
      //));
      //expect(domain.wallets.byWallet.getOne('pubkey'), isNotNull);
      //expect(domain.wallets.byWallet.getOne('pubkey')!.derivation, '');
    });
  });
}
