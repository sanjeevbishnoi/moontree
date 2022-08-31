/// all triggers are singletons so they always listen

import 'package:moontree/foundation/triggers/asset.dart';
import 'package:moontree/foundation/triggers/holding.dart';
import 'package:moontree/foundation/triggers/transaction.dart';
import 'package:moontree/foundation/triggers/address.dart';
import 'package:moontree/foundation/triggers/wallet.dart';
import 'package:moontree/foundation/triggers/unspent.dart';

ToAssetDomain toAssetDomain = ToAssetDomain();
ToHoldingDomain toHoldingDomain = ToHoldingDomain();
ToTransactionDomain toTransactionDomain = ToTransactionDomain();
ToAddressDomain toAddressDomain = ToAddressDomain();
ToWalletDomain toWalletDomain = ToWalletDomain();
ToUnspentDomain toUnspentDomain = ToUnspentDomain();
