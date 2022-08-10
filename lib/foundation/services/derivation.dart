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
  Future<void> makeFirstWallet() async {
    // if there are no wallets, make one and save it to cache and database
    final walletCount = datamodel.wallets.records.length;
    if (walletCount == 0) {
      // make a wallet
      final wallet = generateWalletRecord(
        name: 'default',
        mnemonic: generateMnemoic(),
      );
      // save it to cache and database
      await datamodel.wallets.save(wallet);
    }
  }

  /// triggered by a listener on data incoming from server.
  Future<void> saveAddress(
    WalletDeviceRecord wallet,
    AddressDeviceRecord addressFromServer,
  ) async {
    final addressFromDatamodel =
        datamodel.addresses.byId.getOne(addressFromServer.id);
    if (addressFromDatamodel != null) {
      // update the address in the cache and database
      await datamodel.addresses.save(AddressDeviceRecord(
        address: addressFromDatamodel.address,
        seed: addressFromDatamodel.seed!,
        used: addressFromServer.used,
        index: addressFromServer.index,
      ));
    } else {
      // save the address to the cache and database
      await datamodel.addresses.save(generateAddressRecord(
        wallet: wallet,
        index: addressFromServer.index,
        used: addressFromServer.used,
      ));
    }
  }

  void run() {
    makeFirstWallet();

    /// checkin with the server, proving the public key of the wallets we have.
    /// this process should be handled by listeners because the server will send
    /// us lots of data back: first it'll send the number of addresses it has
    /// derived for this wallet, then it'll send the wallet balances. it wont
    /// simply return.
  }
}
