import 'package:collection/collection.dart';
import 'package:moontree/foundation/domain/records/wallet.dart';
import 'package:proclaim/proclaim.dart';

part 'wallet.keys.dart';

class WalletProclaim extends Proclaim<_IdKey, DomainWallet> {
  late IndexMultiple<_IdKey, DomainWallet> byId;
  late IndexMultiple<_IdKey, DomainWallet> byWallet;
  late IndexMultiple<_NameIdKey, DomainWallet> byName;

  WalletProclaim() : super(_IdKey()) {
    byWallet = addIndexMultiple('wallet', _IdKey());
    byName = addIndexMultiple('name', _NameIdKey());
    byId = byWallet;
  }
}
