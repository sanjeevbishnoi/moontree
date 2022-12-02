/// most of these triggers are listening for crud operations on the database.
/// most crud operations on the database happen by the server.
/// but sometimes the server sends us messages that don't correlate with
/// data_model records, so this trigger is listening for messages like those
/// from the server.

import 'package:moontree/foundation/foundation.dart';
import 'package:moontree_client/moontree_client.dart';
import 'package:moontree_utils/moontree_utils.dart' show Trigger;
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;

/// maybe this should be used to save all datamodel objects to cache? idk.
class FromServerToDatamodel extends Trigger {
  /// From server Record to client Record:
  void init() {
    /// handles all messages from the server used by the serverRecord since this
    /// endpoint's send message function is what is attacthed to the
    /// serverRecord. most messages that are recieved are merely saved to our
    /// local datamodel disk and memory cache, but some messages are a little
    /// more complicated and require some processing. These are combination
    /// messages and generic messages.
    when(
      thereIsA: client().connection.stream,
      andIf: null,
      doThis: _handleItem,
    );
  }

  Future<void> _handleItem(SerializableEntity item) async {
    if (item is AddressBalanceRecord) {
      await data.addressBalances.save(item);
    } else if (item is AddressRecord) {
      await data.addresses.save(item);
    } else if (item is AssetRecord) {
      await data.assets.save(item);
    } else if (item is TransactionRecord) {
      await data.transactions.save(item);
    } else if (item is VinRecord) {
      await data.vins.save(item);
    } else if (item is VoutRecord) {
      await data.vouts.save(item);
    } else if (item is WalletAddressRecord) {
      await data.walletsAddresses.save(item);
    } else if (item is WalletBalanceRecord) {
      await data.walletsBalances.save(item);
    } else if (item is WalletRecord) {
      print('WARNING: wallet record recieved from server. '
          'We make our own wallets, why would we get one from the server?');
      //await data.wallets.save(item);
    } else if (item is GenericRecord) {
      await _handleMessage(item);
    } else if (item is ComboRecord) {
      await _handleCombo(item);
    } else {}
  }

  // handles reorgs only at this point.
  Future<void> _handleMessage(GenericRecord item) async => item.message ==
          'reorg'

      /// delete all objects from data with height > item.value
      ? await data.DatamodelCache.deleteAllWithHeightGreaterThan(item.value!)

      /// no other messages from server exist.
      : print('description: ${item.description}');

  /// handles addresses from derviation process for keypair and hd wallets
  /// as well as runtime derivation process for hd wallets
  Future<void> _handleCombo(ComboRecord item) async =>
      item.item1 is WalletRecord && item.item2 is AddressRecord
          ? DerivationProcessor().saveAddress(
              item.item1 as WalletRecord,
              item.item2 as AddressRecord,
            )
          : null // place to allow for other combinations
      ;
}
