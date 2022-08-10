// ignore_for_file: avoid_print

/// this is mainly for illustrative perposes: how to generate an address from a
/// wallet

import 'package:test/test.dart';
import 'package:ravencoin_wallet/ravencoin_wallet.dart' show HDWallet, Derive;
import 'package:moontree/foundation/utils/derivation.dart';

void main() {
  setUp(() {});
  test('should do something', () async {
    final mnemonic = generateMnemoic();
    final hdwallet = HDWallet.fromSeed(generateSeed(mnemonic));
    final address = Derive.subWallet(hdWallet: hdwallet, path: 'm/0', index: 1);
    print(address.privKey);
    print(address.base58Priv);
    final wallet = generateWalletRecord(
        name: 'name', derivation: 'm/0', mnemonic: mnemonic);
    final addressfromwallet = Derive.subWallet(
        hdWallet: generateHDWallet(wallet.mnemonic), path: 'm/0', index: 1);
    print(addressfromwallet.privKey);
    print(addressfromwallet.base58Priv);
    expect(0, 0.0);
  });
}
