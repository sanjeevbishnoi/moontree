import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

extension DomainAssetHasManyDomainHoldings on DomainAsset {
  Iterable<DomainHolding> get holdings =>
      domain.holdings.byAsset.getAll(symbol, protocol);
}

extension DomainAssetHasManyDomainTransactions on DomainAsset {
  Iterable<DomainTransaction> get transactions =>
      domain.transactions.byAsset.getAll(symbol, protocol);
}
