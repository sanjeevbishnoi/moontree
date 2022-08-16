import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as cache;

extension DomainAddressHasOneDomainWallet on DomainAddress {
  DomainWallet? get wallet => cache.wallets.byId.getOne(walletPub);
}

extension DomainAddressHasManyDomainUnspents on DomainAddress {
  Iterable<DomainUnspent> get unspents =>
      cache.unspents.byAddress.getAll(address);
}
