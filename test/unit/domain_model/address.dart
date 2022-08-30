// ignore_for_file: avoid_print

//import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:moontree/foundation/triggers/address.dart' show ToAddressDomain;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

import '../../fixtures/domain_model/fixtures.dart' as domain_fixtures;
import '../../fixtures/data_model/fixtures.dart';
import '../../fixtures/data_model/sets/wallet_address.dart';

void main() {
  group('address', () {
    setUp(() {});
    test('data_model address to domain_model address', () async {
      domain_fixtures.useFixture();
      useFixture(WalletWithAddress());
      final address = WalletWithAddress.address;
      expect(domain.addresses.byId.getOne(address.address), isNull);

      await ToAddressDomain.load(address);
      expect(domain.addresses.byId.getOne(address.address), isNotNull);
      expect(domain.addresses.byId.getOne(address.address)!.walletPub,
          WalletWithAddress.wallet.pubkey);
    });
  });
}
