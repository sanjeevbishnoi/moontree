import 'package:moontree/foundation/data_model/joins/joins.dart';

import 'address_balance.dart';
import 'address.dart';
import 'asset.dart';
import 'transaction.dart';
import 'vin.dart';
import 'vout.dart';
import 'wallet_address.dart';
import 'wallet_balance.dart';
import 'wallet.dart';

export 'address_balance.dart';
export 'address.dart';
export 'asset.dart';
export 'transaction.dart';
export 'vin.dart';
export 'vout.dart';
export 'wallet_address.dart';
export 'wallet_balance.dart';
export 'wallet.dart';

AddressBalanceProclaim addressBalances = AddressBalanceProclaim();
AddressProclaim addresses = AddressProclaim();
AssetProclaim assets = AssetProclaim();
TransactionProclaim transactions = TransactionProclaim();
VinProclaim vins = VinProclaim();
VoutProclaim vouts = VoutProclaim();
WalletAddressProclaim walletAddresses = WalletAddressProclaim();
WalletBalanceProclaim walletBalances = WalletBalanceProclaim();
WalletProclaim wallets = WalletProclaim();

// namespace
class DatamodelCache {
  static Future<void> deleteAllWithHeightGreaterThan(int height) async {
    await addressBalances
        .removeAll(addressBalances.byHeightGreaterThan(height));
    final reorgedTransactions = transactions.byHeightGreaterThan(height);
    reorgedTransactions.forEach((transaction) async {
      await vins.removeAll(transaction.vins);
      await vouts.removeAll(transaction.vouts);
    });
    await transactions.removeAll(reorgedTransactions);
    await walletBalances.removeAll(walletBalances.byHeightGreaterThan(height));
  }
}
