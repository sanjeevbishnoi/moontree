/// all triggers are singletons so they always listen

import 'package:moontree/foundation/triggers/asset.dart';
import 'package:moontree/foundation/triggers/holding.dart';
//import 'package:moontree/foundation/triggers/transaction.dart';
//import 'package:moontree/foundation/triggers/unspent.dart';
//import 'package:moontree/foundation/triggers/address.dart';
//import 'package:moontree/foundation/triggers/wallet.dart';

ToAssetDomain toAssetDomain = ToAssetDomain();
ToHoldingDomain toHoldingDomain = ToHoldingDomain();
/// TODO: finish
//ToTransactionDomain toTransactionDomain = ToTransactionDomain();
//ToUnspentDomain toUnspentDomain = ToUnspentDomain();

//ToAddressDomain toAddressDomain = ToAddressDomain();
//ToWalletDomain toWalletDomain = ToWalletDomain();
