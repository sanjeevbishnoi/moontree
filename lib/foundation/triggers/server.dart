/// most of these triggers are listening for crud operations on the database.
/// most crud operations on the database happen by the server.
/// but sometimes the server sends us messages that don't correlate with
/// data_model records, so this trigger is listening for messages like those
/// from the server.

import 'package:moontree/foundation/foundation.dart';
import 'package:moontree_client/moontree_client.dart';
import 'package:proclaim/change.dart';
import 'package:utils/trigger.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain_model/records/asset.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

/// maybe this should be used to save all datamodel objects to cache? idk.
class FromServerToDatamodel extends Trigger {
  /// From server DeviceRecord to client DeviceRecord:
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
    if (item is AddressBalanceDeviceRecord) {
      await datamodel.addressBalances.save(item);
    } else if (item is AddressDeviceRecord) {
      await datamodel.addresses.save(item);
    } else if (item is AssetDeviceRecord) {
      await datamodel.assets.save(item);
    } else if (item is TransactionDeviceRecord) {
      await datamodel.transactions.save(item);
    } else if (item is VinDeviceRecord) {
      await datamodel.vins.save(item);
    } else if (item is VoutDeviceRecord) {
      await datamodel.vouts.save(item);
    } else if (item is WalletAddressDeviceRecord) {
      await datamodel.walletAddresses.save(item);
    } else if (item is WalletBalanceDeviceRecord) {
      await datamodel.walletBalances.save(item);
    } else if (item is WalletDeviceRecord) {
      print('WARNING: wallet record recieved from server. '
          'We make our own wallets, why would we get one from the server?');
      //await datamodel.wallets.save(item);
    } else if (item is GenericDeviceRecord) {
      await _handleMessage(item);
    } else if (item is ComboDeviceRecord) {
      await _handleCombo(item);
    } else {}
  }

  // handles reorgs only at this point.
  Future<void> _handleMessage(GenericDeviceRecord item) async =>
      item.message == 'reorg'

          /// delete all objects from datamodel with height > item.value
          ? await datamodel.DatamodelCache.deleteAllWithHeightGreaterThan(
              item.value!)

          /// no other messages from server exist.
          : print('description: ${item.description}');

  /// handles addresses from derviation process for keypair and hd wallets
  /// as well as runtime derivation process for hd wallets
  Future<void> _handleCombo(ComboDeviceRecord item) async =>
      item.item1 is WalletDeviceRecord && item.item2 is AddressDeviceRecord
          ? DerivationProcessor().saveAddress(
              item.item1 as WalletDeviceRecord,
              item.item2 as AddressDeviceRecord,
            )
          : null // place to allow for other combinations
      ;
}
