import 'package:wallet_utils/wallet_utils.dart' show Derivation;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

extension DomainWalletHasManyDomainUnspent on DomainWallet {
  Iterable<DomainUnspent> get unspents => domain.unspents.byWallet.getAll(pub);
}

extension DomainWalletHasManyDomainUnspents on DomainWallet {
  Iterable<DomainAddress> get addresses =>
      domain.addresses.byWallet.getAll(pub);
}

extension DomainWalletHasManyDomainHoldings on DomainWallet {
  Iterable<DomainHolding> get holdings => domain.holdings.byWallet.getAll(pub);
}

extension DomainWalletHasManyDomainTransactions on DomainWallet {
  Iterable<DomainTransaction> get transactions =>
      domain.transactions.byWallet.getAll(pub);
}

extension DomainWalletCorrespondsToADataModelWallet on DomainWallet {
  WalletRecord get datamodelWalletExternal => data.wallets.byId
      .getOne(pub, derivation ?? Derivation.getPath(external: true))!;
  WalletRecord get datamodelWalletInternal => data.wallets.byId
      .getOne(pub, derivation ?? Derivation.getPath(external: false))!;
}
