import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as cache;

extension DomainHoldingHasOneDomainWallet on DomainHolding {
  DomainWallet get wallet => cache.wallets.byId.getOne(pub)!;
}

extension DomainHoldingHasOneDomainAsset on DomainHolding {
  DomainAsset get asset => cache.assets.byId.getOne(symbol, protocol)!;
}

extension DomainHoldingHasManyDomainTransactions on DomainHolding {
  Iterable<DomainTransaction> get transactions =>
      cache.transactions.byWalletAsset.getAll(pub, symbol, protocol);
}
