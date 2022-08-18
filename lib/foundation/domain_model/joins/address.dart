import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

extension DomainAddressHasOneDomainWallet on DomainAddress {
  DomainWallet? get wallet => domain.wallets.byId.getOne(walletPub);
}

extension DomainAddressHasManyDomainUnspents on DomainAddress {
  Iterable<DomainUnspent> get unspents =>
      domain.unspents.byAddress.getAll(address);
}
