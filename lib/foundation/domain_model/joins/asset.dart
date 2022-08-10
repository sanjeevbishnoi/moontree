import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as cache;

extension DomainAssetHasManyDomainHoldings on DomainAsset {
  Iterable<DomainHolding> get holdings =>
      cache.holdings.byAsset.getAll(symbol, protocol);
}

extension DomainAssetHasManyDomainTransactions on DomainAsset {
  Iterable<DomainTransaction> get transactions =>
      cache.transactions.byAsset.getAll(symbol, protocol);
}
