import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

extension DomainTransactionHasManyDomainHoldings on DomainTransaction {
  Iterable<DomainHolding> get holdings =>
      domain.holdings.byAsset.getAll(symbol, protocol);
}

extension DomainTransactionHasOneDomainAsset on DomainTransaction {
  DomainAsset get asset => domain.assets.byId.getOne(symbol, protocol)!;
}
