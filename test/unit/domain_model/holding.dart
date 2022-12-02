// ignore_for_file: avoid_print

//import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/triggers/holding.dart' show ToHoldingDomain;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

import '../../fixtures/data_model/sets/wallet_address.dart';
import '../../fixtures/domain_model/fixtures.dart';

void main() {
  group('holding', () {
    setUp(() {});
    test('data_model balance to domain_model holding', () async {
      useFixture();
      final asset = AssetRecord(
        symbol: 'MOONTREE',
        reissuable: false,
        supply: 1000,
        divisibility: 4,
      );
      final balance = WalletBalanceRecord(
        pubkey: WalletWithAddress.wallet.pubkey,
        derivation: WalletWithAddress.wallet.derivation,
        symbol: asset.symbol,
        sats: 100,
        height: 1,
      );
      final call = () => domain.holdings.byId.getOne(
            balance.symbol,
            Protocols.ravencoinMainnet,
            balance.pubkey,
          );
      expect(call(), isNull);
      await ToHoldingDomain.load(balance);
      expect(call(), isNotNull);
    });
  });
}
