import 'package:ravencoin_wallet/ravencoin_wallet.dart' show Derivation;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as cache;

extension DomainWalletHasManyDomainUnspent on DomainWallet {
  Iterable<DomainUnspent> get unspents => cache.unspents.byWallet.getAll(pub);
}

extension DomainWalletHasManyDomainUnspents on DomainWallet {
  Iterable<DomainAddress> get addresses => cache.addresses.byWallet.getAll(pub);
}

extension DomainWalletHasManyDomainHoldings on DomainWallet {
  Iterable<DomainHolding> get holdings => cache.holdings.byWallet.getAll(pub);
}

extension DomainWalletHasManyDomainTransactions on DomainWallet {
  Iterable<DomainTransaction> get transactions =>
      cache.transactions.byWallet.getAll(pub);
}

extension DomainWalletCorrespondsToADataModelWallet on DomainWallet {
  WalletDeviceRecord get datamodelWalletExternal => datamodel.wallets.byId
      .getOne(pub, derivation ?? Derivation.getPath(external: true))!;
  WalletDeviceRecord get datamodelWalletInternal => datamodel.wallets.byId
      .getOne(pub, derivation ?? Derivation.getPath(external: false))!;
}
