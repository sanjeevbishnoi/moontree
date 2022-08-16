/// the derviation process, and it's context looks like this:
/// - we start the app
/// - we load wallets from the database to the cache
///   - if there are no wallets, we make one and save it to cache and database
///   - then we would normally derive addresses, but we don't.
///     - unlike v1 we don't have to do anything special during this process
///       like checking each address for transactions. instead we merely...
/// - checkin with the server, proving the public key of the wallets we have.
/// - it then does derivation on it's side, it figures out which addresses are
///   ours. and it sends those addresses to us.
/// - for each one we get, we actually derive the address ourselves or get the
///   private key from the database if it already exists, and save the private
///   key to the record received from the server. then we save the record.
/// - notice it doesn't send us address balances. we can subscribe to those if
///   we want separately.
/// - whenever it gives us a new address object, which it will on a new tx we'll
///   derive the same address so we know it's private key.
/// - as far as subscriptions go...
///   - the first one we subscribe to is holdings.
///   - then transactions
///   - ...but this is out side the scope of the derviation process now.
import 'package:ravencoin_wallet/ravencoin_wallet.dart' show Derivation;
import 'package:moontree/foundation/data_model/data_model.dart' as datamodel;
import 'package:moontree/foundation/data_model/joins/joins.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/utils/derivation.dart';
import 'package:utils/list.dart';

// a namespace class
class DerivationProcessor {
  DerivationProcessor();

  /// must be called after the data_model is loaded from hive boxes
  /// and before the derivation process is started.
  /// makes a wallet if there are none.
  Future<void> makeFirstWalletPair() async {
    // if there are no wallets, make one and save it to cache and database
    if (datamodel.wallets.records.length == 0) {
      final mnemonic = generateMnemoic();
      await makeSaveWallet(
          'Wallet 1', mnemonic, Derivation.getPath(external: true));
      await makeSaveWallet(
          'Wallet 2', mnemonic, Derivation.getPath(external: false));
    }
  }

  Future<void> makeSaveWallet(
    String name,
    String mnemonic,
    String path,
  ) async =>
      await datamodel.wallets.save(generateWalletRecord(
        name: name,
        mnemonic: mnemonic,
        derivation: path,
      ));

  /// triggered by a listener on data incoming from server.
  Future<void> saveAddress(
    WalletDeviceRecord serverWallet,
    AddressDeviceRecord serverAddress,
  ) async {
    final localAddress = datamodel.addresses.byId.getOne(serverAddress.id);
    if (localAddress != null) {
      // update the address in the cache and database
      await datamodel.addresses.save(AddressDeviceRecord(
        address: localAddress.address,
        seed: localAddress.seed!,
        used: serverAddress.used,
        index: serverAddress.index,
      ));
    } else {
      // find the wallet so it has a mnemonic present
      final localWallet = datamodel.wallets.byId.getOne(
        serverWallet.pubkey,
        serverWallet.derivation,
      )!; // if it's not there... I wanna hear about it.
      // save the address to the cache and database
      await datamodel.addresses.save(generateAddressRecord(
        wallet: localWallet,
        index: serverAddress.index,
        used: serverAddress.used,
      ));
    }
  }

  void run() {
    makeFirstWalletPair();

    /// checkin with the server, proving the public key of the wallets we have.
    /// this process should be handled by listeners because the server will send
    /// us lots of data back: first it'll send the number of addresses it has
    /// derived for this wallet, then it'll send the wallet balances. it wont
    /// simply return.
  }
}
