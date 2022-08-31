// ignore_for_file: avoid_print
import 'package:flutter_test/flutter_test.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/utils/derivation.dart';
import 'package:moontree/foundation/services/derivation.dart'
    show DerivationProcessor;

import '../../fixtures/data_model/fixtures.dart';
import '../../fixtures/data_model/sets/wallet.dart';
import '../../fixtures/data_model/sets/wallet_address.dart';

void main() {
  group('address', () {
    final wallet = WalletWithAddress.wallet;
    final address = WalletWithAddress.address;
    setUp(() {});

    test('create data_model address', () async {
      expect(
        generateAddressRecord(
          wallet: wallet,
          index: address.index,
          used: address.used,
        ),
        address,
      );
    });

    test('save data_model address', () async {
      useFixture(WalletOnly());
      final call = () => data.addresses.byId.getOne(address.address);
      expect(call(), isNull);
      await DerivationProcessor().saveAddress(wallet, address);
      expect(call(), address);
    });
  });
}
