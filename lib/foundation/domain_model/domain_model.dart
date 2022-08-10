/// initialize proclaim for this cache

import 'package:proclaim/proclaim.dart' show MapSource;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as pros;

class DomainModel {
  static void init() {
    pros.addresses.setSource(MapSource(pros.AddressProclaim.defaults));
    pros.assets.setSource(MapSource(pros.AssetProclaim.defaults));
    pros.holdings.setSource(MapSource(pros.HoldingProclaim.defaults));
    pros.transactions.setSource(MapSource(pros.TransactionProclaim.defaults));
    pros.unspents.setSource(MapSource(pros.UnspentProclaim.defaults));
    pros.wallets.setSource(MapSource(pros.WalletProclaim.defaults));
  }
}
