/// raw functionality of creating WalletDeviceRecord and AddressDeviceRecord

import 'dart:typed_data';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ravencoin_wallet/ravencoin_wallet.dart' show HDWallet, Derive;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;

String generateMnemoic({String? entropy}) => entropy == null
    ? bip39.generateMnemonic()
    : bip39.entropyToMnemonic(entropy);

String generateEntropy({String? mnemonic}) =>
    bip39.mnemonicToEntropy(mnemonic ?? bip39.generateMnemonic());

Uint8List generateSeed() => bip39.mnemonicToSeed(bip39.generateMnemonic());

Uint8List generateSeedFromMnemonic(String mnemonic) =>
    bip39.mnemonicToSeed(mnemonic);

Uint8List generateSeedFromEntropy(String entropy) =>
    bip39.mnemonicToSeed(bip39.entropyToMnemonic(entropy));

WalletDeviceRecord generateHDWallet({
  required String name,
  required String derivation,
  required String mnemonic,
}) =>
    WalletDeviceRecord(
      pubkey: HDWallet.fromSeed(generateSeedFromMnemonic(mnemonic)).pubKey,
      derivation: derivation,
      name: name,
      mnemonic: mnemonic,
    );

AddressDeviceRecord generateHDAddress({
  required WalletDeviceRecord wallet,
  required int index,
  required bool used,
}) =>
    AddressDeviceRecord(
      address: Derive.deriveHDWallet(
        wallet.pubkey,
        wallet.derivation ?? '',
        index,
      ).address!,
      used: used,
      index: index,
    );
