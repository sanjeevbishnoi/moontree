import 'package:moontree/foundation/domain_model/domain_model.dart';
import 'sets/sets.dart';

void useFixture([EmptySet? chosenSet]) {
  chosenSet ??= EmptySet();
  DomainModel.init(
    addresses: chosenSet.addresses,
    assets: chosenSet.assets,
    holdings: chosenSet.holdings,
    transactions: chosenSet.transactions,
    unspents: chosenSet.unspents,
    wallets: chosenSet.wallets,
  );
}
