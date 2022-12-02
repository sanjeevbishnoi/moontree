import 'package:collection/collection.dart';
import 'package:proclaim/proclaim.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

part 'wallet_balance.keys.dart';

class WalletBalanceProclaim extends Proclaim<_IdKey, WalletBalanceRecord> {
  late IndexMultiple<_IdKey, WalletBalanceRecord> byId;
  late IndexMultiple<_WalletKey, WalletBalanceRecord> byWallet;
  late IndexMultiple<_SymbolKey, WalletBalanceRecord> bySymbol;

  WalletBalanceProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
    byWallet = addIndexMultiple('walletid', _WalletKey());
    bySymbol = addIndexMultiple('symbol', _SymbolKey());
  }

  static Map<String, WalletBalanceRecord> get defaults => {};

  Set<String> get ids => records.map((e) => e.id).toSet();

  Iterable<WalletBalanceRecord> byPubkeyAndLessThanHeight(
    String pubkey,
    String derivation,
    int? height, // null is mempool
  ) =>
      height == null
          ? byWallet.getAll(pubkey, derivation).where((e) => e.height == null)
          : byWallet
              .getAll(pubkey, derivation)
              .where((e) => e.height != null && e.height! < height);

  Iterable<WalletBalanceRecord> byHeightGreaterThan(int height) =>
      records.where((e) => e.height != null && e.height! > height);
}
