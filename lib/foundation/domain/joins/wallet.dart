import 'package:moontree/foundation/domain/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/domain/records/records.dart';

extension DomainWalletHasManyDomainUnspent on DomainWallet {
  Iterable<DomainUnspent> get unspents =>
      cache.unspents.byWallet.getAll(pub, derivation);
}

extension DomainWalletHasManyDomainUnspents on DomainWallet {
  Iterable<DomainAddress> get addresses =>
      cache.addresses.byWallet.getAll(pub, derivation);
}

extension DomainWalletHasManyDomainHoldings on DomainWallet {
  Iterable<DomainHolding> get holdings =>
      cache.holdings.byWallet.getAll(pub, derivation);
}

extension DomainWalletHasManyDomainTransactions on DomainWallet {
  Iterable<DomainTransaction> get transactions =>
      cache.transactions.byWallet.getAll(pub, derivation);
}
