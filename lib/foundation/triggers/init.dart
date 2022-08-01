import 'package:moontree/foundation/triggers/triggers.dart' as triggers;

void initTriggers() {
  triggers.toAssetDomain.init();
  triggers.toHoldingDomain.init();
  //triggers.toTransactionDomain.init();
  //triggers.toUnspentDomain.init();
  //triggers.toAddressDomain.init();
  //triggers.toWalletDomain.init();
}
