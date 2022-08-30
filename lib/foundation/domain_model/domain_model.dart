/// initialize proclaim for this cache

import 'package:proclaim/proclaim.dart' show MapSource;
import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class DomainModel {
  static void init({
    Map<String, DomainAddress>? addresses,
    Map<String, DomainAsset>? assets,
    Map<String, DomainHolding>? holdings,
    Map<String, DomainTransaction>? transactions,
    Map<String, DomainUnspent>? unspents,
    Map<String, DomainWallet>? wallets,
  }) {
    domain.addresses.setSource(
      MapSource(addresses ?? domain.AddressProclaim.defaults),
    );
    domain.assets.setSource(
      MapSource(assets ?? domain.AssetProclaim.defaults),
    );
    domain.holdings.setSource(
      MapSource(holdings ?? domain.HoldingProclaim.defaults),
    );
    domain.transactions.setSource(
      MapSource(transactions ?? domain.TransactionProclaim.defaults),
    );
    domain.unspents.setSource(
      MapSource(unspents ?? domain.UnspentProclaim.defaults),
    );
    domain.wallets.setSource(
      MapSource(wallets ?? domain.WalletProclaim.defaults),
    );
  }
}
