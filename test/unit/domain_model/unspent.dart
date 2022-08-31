// ignore_for_file: avoid_print

//import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/triggers/unspent.dart' show ToUnspentDomain;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

import '../../fixtures/data_model/sets/wallet_address_transaction.dart';
import '../../fixtures/data_model/fixtures.dart';
import '../../fixtures/domain_model/fixtures.dart' as domain_fixtures;

void main() {
  group('unspent', () {
    setUp(() {});
    test('data_model spent vout not to domain_model unspent', () async {
      domain_fixtures.useFixture();
      useFixture(WalletWithAddressAndTransactions());
      final voutCall = () => domain.unspents.byId.getOne(
            WalletWithAddressAndTransactions.vout1.transactionHash,
            WalletWithAddressAndTransactions.vout1.position,
            Protocol.ravencoinMainnet,
          );
      expect(voutCall(), isNull);
      await ToUnspentDomain.load(WalletWithAddressAndTransactions.vout1);
      expect(voutCall(), isNull);
    });

    test('data_model unspent vout to domain_model unspent', () async {
      domain_fixtures.useFixture();
      useFixture(WalletWithAddressAndTransactions());
      final unspentCall = () => domain.unspents.byId.getOne(
            WalletWithAddressAndTransactions.vout3.transactionHash,
            WalletWithAddressAndTransactions.vout3.position,
            Protocol.ravencoinMainnet,
          );
      expect(unspentCall(), isNull);
      await ToUnspentDomain.load(WalletWithAddressAndTransactions.vout3);
      expect(unspentCall(), isNotNull);
    });
  });
}
