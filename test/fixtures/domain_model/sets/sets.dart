import 'package:moontree/foundation/domain_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

class EmptySet {
  Map<String, DomainAddress> get addresses => {};
  Map<String, DomainAsset> get assets => {};
  Map<String, DomainHolding> get holdings => {};
  Map<String, DomainTransaction> get transactions => {};
  Map<String, DomainUnspent> get unspents => {};
  Map<String, DomainWallet> get wallets => {};
}

class DefaultSet extends EmptySet {
  @override
  Map<String, DomainAddress> get addresses => domain.AddressProclaim.defaults;
  @override
  Map<String, DomainAsset> get assets => domain.AssetProclaim.defaults;
  @override
  Map<String, DomainHolding> get holdings => domain.HoldingProclaim.defaults;
  @override
  Map<String, DomainTransaction> get transactions =>
      domain.TransactionProclaim.defaults;
  @override
  Map<String, DomainUnspent> get unspents => domain.UnspentProclaim.defaults;
  @override
  Map<String, DomainWallet> get wallets => domain.WalletProclaim.defaults;
}
