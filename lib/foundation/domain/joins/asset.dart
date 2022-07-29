import 'package:moontree/foundation/domain/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/domain/records/records.dart';

extension DomainAssetHasManyDomainHoldings on DomainAsset {
  Iterable<DomainHolding> get holdings =>
      cache.holdings.byAsset.getAll(symbol, protocol);
}

extension DomainAssetHasManyDomainTransactions on DomainAsset {
  Iterable<DomainTransaction> get transactions =>
      cache.transactions.byAsset.getAll(symbol, protocol);
}
