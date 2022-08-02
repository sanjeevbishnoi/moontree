/// raw functionality of creating WalletDeviceRecord and AddressDeviceRecord
///
/// We must perform address derviations on the device to verify the addresses,
/// such as the change and receive addresses the server gives us. This is a
/// service in the foundation because when triggered it merely saves its
/// derviations to the database.
///
/// the process of deriving addresses isn't contained here. it is the context in
/// which this functional code is used. But we'll describe it here until it's
/// built out. it looks like this:
/// - we start the app
/// - we load wallets from the database to the cache
///   - if there are no wallets, we make one and save it to cache and database
///   - then we would normally derive addresses, but we don't.
///     - unlike v1 we don't have to do anything special during this process
///       like checking each address for transactions. instead we merely...
/// - checkin with the server, proving the public key of the wallets we have.
/// - it then does derivation on it's side figures out which addresses are ours
///   and sends their balances to us.
/// - we derive the same addresses since when we derive it we can get the
///   private key
/// - then we attach the private key to the address record we received from the
///   server.
/// - whenever it gives us a new address object, which it will on a new tx
///   - we'll derive the same address so we know it's private key.
/// - as far as subscriptions go...
///   - the first one we subscribe to is holdings.
///   - then transactions
///   - ...but this is out side the scope of the derviation process now.

import 'dart:typed_data';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ravencoin_wallet/ravencoin_wallet.dart' show HDWallet, Derive;
import 'package:moontree/foundation/data_model/records/records.dart';

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

/// this is the way the server derives an address - we need to save the private
/// key too
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
