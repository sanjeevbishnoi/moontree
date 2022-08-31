// ignore_for_file: avoid_print

//import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/triggers/transaction.dart'
    show ToTransactionDomain;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

import '../../fixtures/data_model/sets/wallet_address_transaction.dart';
import '../../fixtures/data_model/fixtures.dart';
import '../../fixtures/domain_model/fixtures.dart' as domain_fixtures;

void main() {
  group('transaction', () {
    setUp(() {});
    test('data_model transaction to domain_model transaction', () async {
      domain_fixtures.useFixture();
      useFixture(WalletWithAddressAndTransactions());
      final tx1Call = () => domain.transactions.byId.getOne(
            WalletWithAddressAndTransactions.transaction1.hash,
            WalletWithAddressAndTransactions.asset.symbol,
            Protocol.ravencoinMainnet,
            WalletWithAddressAndTransactions.wallet.pubkey,
          );
      final tx2Call = () => domain.transactions.byId.getOne(
            WalletWithAddressAndTransactions.transaction2.hash,
            WalletWithAddressAndTransactions.asset.symbol,
            Protocol.ravencoinMainnet,
            WalletWithAddressAndTransactions.wallet.pubkey,
          );
      expect(tx1Call(), isNull);
      await ToTransactionDomain.load(
          WalletWithAddressAndTransactions.transaction1);
      expect(tx1Call(), isNotNull);
      expect(tx2Call(), isNull);
      await ToTransactionDomain.load(
          WalletWithAddressAndTransactions.transaction2);
      expect(tx2Call(), isNotNull);
    });
  });
}
