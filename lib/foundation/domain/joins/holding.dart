import 'package:moontree/foundation/domain/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/domain/records/records.dart';

extension DomainHoldingHasOneDomainWallet on DomainHolding {
  DomainWallet get wallet => cache.wallets.byId.getOne(pub, derivation)!;
}

extension DomainHoldingHasOneDomainAsset on DomainHolding {
  DomainAsset get asset => cache.assets.byId.getOne(symbol, protocol)!;
}

extension DomainHoldingHasManyDomainTransactions on DomainHolding {
  Iterable<DomainTransaction> get transactions =>
      cache.transactions.byWalletAsset
          .getAll(pub, derivation, symbol, protocol);
}
