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
    /// handles addresses from derviation process for keypair and hd wallets
    /// as well as runtime derivation process for hd wallets
    when(
        thereIsA: client().ConnectionEndpoint.stream,
        andIf: null,
        doThis: (ComboDeviceRecord linkAddress) async =>
            DerivationProcessor().saveAddress(
              linkAddress.item1 as WalletDeviceRecord,
              linkAddress.item2 as AddressDeviceRecord,
            ));

    /// handles something address balance, wallet balance, transactions etc.
    //when(
    //    thereIsA: client().ConnectionEndpoint.stream,
    //    andIf: null,
    //    doThis: (ComboDeviceRecord linkAddress) async =>
    //        DerivationProcessor().saveAddress(
    //          linkAddress.item1 as WalletDeviceRecord,
    //          linkAddress.item2 as AddressDeviceRecord,
    //        ));
  }
  //Future<void> listen() async => await for (var message in client.myEndpoint.stream) {
  //  _handleMessage(message);
  //}
}
