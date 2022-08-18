import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

extension DomainHoldingHasOneDomainWallet on DomainHolding {
  DomainWallet get wallet => domain.wallets.byId.getOne(pub)!;
}

extension DomainHoldingHasOneDomainAsset on DomainHolding {
  DomainAsset get asset => domain.assets.byId.getOne(symbol, protocol)!;
}

extension DomainHoldingHasManyDomainTransactions on DomainHolding {
  Iterable<DomainTransaction> get transactions =>
      domain.transactions.byWalletAsset.getAll(pub, symbol, protocol);
}
