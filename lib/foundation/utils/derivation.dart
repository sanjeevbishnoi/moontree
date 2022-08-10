/// raw functionality of creating WalletDeviceRecord and AddressDeviceRecord
///
/// We must perform address derviations on the device to verify the addresses,
/// such as the change and receive addresses the server gives us. This is a
/// service in the foundation because when triggered it merely saves its
/// derviations to the database.
///
/// the process of deriving addresses isn't contained here. it is the context in
/// which this functional code is used. see services/derivation.dart

import 'dart:typed_data';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ravencoin_wallet/ravencoin_wallet.dart'
    show HDWallet, Derive, Derivation;
import 'package:moontree/foundation/data_model/records/records.dart';

String generateMnemoic([String? entropy]) => entropy == null
    ? bip39.generateMnemonic()
    : bip39.entropyToMnemonic(entropy);

String generateEntropy([String? mnemonic]) =>
    bip39.mnemonicToEntropy(mnemonic ?? bip39.generateMnemonic());

Uint8List generateSeed([String? mnemonic]) =>
    bip39.mnemonicToSeed(mnemonic ?? bip39.generateMnemonic());

Uint8List generateSeedFromEntropy(String entropy) =>
    bip39.mnemonicToSeed(bip39.entropyToMnemonic(entropy));

HDWallet generateHDWallet([String? mnemonic]) =>
    HDWallet.fromSeed(generateSeed(mnemonic));

WalletDeviceRecord generateWalletRecord({
  required String name,
  String? derivation,
  String? mnemonic,
}) =>
    WalletDeviceRecord(
      pubkey: HDWallet.fromSeed(generateSeed(mnemonic)).pubKey,
      derivation: derivation ?? Derivation.getPath(),
      name: name,
      mnemonic: mnemonic,
    );

AddressDeviceRecord generateAddressRecord({
  required WalletDeviceRecord wallet,
  required int index,
  required bool used,
}) {
  final addressHDWallet = wallet.derivation == ''
      ? generateHDWallet(wallet.mnemonic)
      : Derive.subWallet(
          hdWallet: generateHDWallet(wallet.mnemonic),
          path: wallet.derivation,
          index: index,
        );
  return AddressDeviceRecord(
    address: addressHDWallet.address!,
    seed: addressHDWallet.seed!,
    used: used,
    index: index,
  );
}
