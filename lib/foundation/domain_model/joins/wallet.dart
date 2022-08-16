import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as cache;

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

extension DomainWalletCorrespondsToADataModelWallet on DomainWallet {
  WalletDeviceRecord get datmodelWallet =>
      datamodel.wallets.byId.getOne(pub, derivation)!;
}
