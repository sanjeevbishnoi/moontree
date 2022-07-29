import 'package:moontree/foundation/domain/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/domain/records/records.dart';

extension DomainTransactionHasManyDomainHoldings on DomainTransaction {
  Iterable<DomainHolding> get holdings =>
      cache.holdings.byAsset.getAll(symbol, protocol);
}

extension DomainTransactionHasOneDomainAsset on DomainTransaction {
  DomainAsset get asset => cache.assets.byId.getOne(symbol, protocol)!;
}
