import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as cache;

extension DomainTransactionHasManyDomainHoldings on DomainTransaction {
  Iterable<DomainHolding> get holdings =>
      cache.holdings.byAsset.getAll(symbol, protocol);
}

extension DomainTransactionHasOneDomainAsset on DomainTransaction {
  DomainAsset get asset => cache.assets.byId.getOne(symbol, protocol)!;
}
