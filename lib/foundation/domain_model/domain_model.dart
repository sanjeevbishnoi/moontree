/// initialize proclaim for this cache

import 'package:proclaim/proclaim.dart' show MapSource;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class DomainModel {
  static void init() {
    domain.addresses.setSource(MapSource(domain.AddressProclaim.defaults));
    domain.assets.setSource(MapSource(domain.AssetProclaim.defaults));
    domain.holdings.setSource(MapSource(domain.HoldingProclaim.defaults));
    domain.transactions
        .setSource(MapSource(domain.TransactionProclaim.defaults));
    domain.unspents.setSource(MapSource(domain.UnspentProclaim.defaults));
    domain.wallets.setSource(MapSource(domain.WalletProclaim.defaults));
  }
}
