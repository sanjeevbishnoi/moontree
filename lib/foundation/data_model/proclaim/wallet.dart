import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'wallet.keys.dart';

class WalletProclaim extends Proclaim<_PubKey, WalletDeviceRecord> {
  late IndexMultiple<_IdKey, WalletDeviceRecord> byId;
  late IndexMultiple<_PubKey, WalletDeviceRecord> byPubKey;
  late IndexMultiple<_DerivationKey, WalletDeviceRecord> byDerivation;

  WalletProclaim() : super(_PubKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byPubKey = addIndexMultiple('pubkey', _PubKey());
    byDerivation = addIndexMultiple('derivationid', _DerivationKey());
  }

  Set<String> get ids => records.map((w) => w.id).toSet();
}
