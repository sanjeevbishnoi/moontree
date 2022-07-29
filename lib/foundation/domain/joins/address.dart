import 'package:moontree/foundation/domain/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/domain/records/records.dart';

extension DomainAddressHasOneDomainWallet on DomainAddress {
  DomainWallet? get wallet =>
      cache.wallets.byId.getOne(walletPub, walletDerivation);
}

extension DomainAddressHasManyDomainUnspents on DomainAddress {
  Iterable<DomainUnspent> get unspents =>
      cache.unspents.byAddress.getAll(address);
}
