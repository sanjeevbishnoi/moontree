/// initialize proclaim for this cache

import 'package:moontree/foundation/domain/proclaim/proclaim.dart' as pros;
import 'package:proclaim/proclaim.dart' show MapSource;

void setupCache() {
  pros.addresses.setSource(MapSource(pros.AddressProclaim.defaults));
  pros.assets.setSource(MapSource(pros.AssetProclaim.defaults));
  pros.holdings.setSource(MapSource(pros.HoldingProclaim.defaults));
  pros.transactions.setSource(MapSource(pros.TransactionProclaim.defaults));
  pros.unspents.setSource(MapSource(pros.UnspentProclaim.defaults));
  pros.wallets.setSource(MapSource(pros.WalletProclaim.defaults));
}
