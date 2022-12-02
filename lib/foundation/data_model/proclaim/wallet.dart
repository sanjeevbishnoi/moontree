import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'wallet.keys.dart';

class WalletProclaim extends Proclaim<_PubKey, WalletRecord> {
  late IndexMultiple<_IdKey, WalletRecord> byId;
  late IndexMultiple<_PubKey, WalletRecord> byPubKey;
  late IndexMultiple<_DerivationKey, WalletRecord> byDerivation;

  WalletProclaim() : super(_PubKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byPubKey = addIndexMultiple('pubkey', _PubKey());
    byDerivation = addIndexMultiple('derivationid', _DerivationKey());
  }

  static Map<String, WalletRecord> get defaults => {};

  Set<String> get ids => records.map((w) => w.id).toSet();
}
