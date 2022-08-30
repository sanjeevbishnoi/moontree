import 'data_model.dart';
import 'sets/sets.dart';

void useFixture([EmptySet? chosenSet]) {
  chosenSet ??= EmptySet();
  DataModel.init(
    addressBalances: chosenSet.addressBalances,
    addresses: chosenSet.addresses,
    assets: chosenSet.assets,
    transactions: chosenSet.transactions,
    vins: chosenSet.vins,
    vouts: chosenSet.vouts,
    walletsAddresses: chosenSet.walletsAddresses,
    walletBalances: chosenSet.walletBalances,
    wallets: chosenSet.wallets,
  );
}
