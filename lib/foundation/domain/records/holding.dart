import 'package:equatable/equatable.dart';
import 'package:moontree/foundation/domain/records/asset.dart';
import 'package:moontree/foundation/domain/records/wallet.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:utils/mixins/string.dart';

class DomainHolding with EquatableMixin, ToStringMixin {
  // holdings point to an domain asset by symbol
  final String symbol;
  final Protocol protocol;
  // amount
  final int sats;
  // link to (transactions point to a holding)
  //final List<DomainTransaction> transactions;
  // must point to wallet too:
  final String pub;
  final String derivation;

  DomainHolding({
    required this.symbol,
    required this.protocol,
    required this.sats,
    required this.pub,
    required this.derivation,
  });

  String get id => generateId(symbol, protocol, pub, derivation);
  static String generateId(
          String symbol, Protocol protocol, String pub, String derivation) =>
      '$symbol:${protocol.name}:$pub:$derivation';

  String get assetId => DomainAsset.generateId(symbol, protocol);
  String get walletId => DomainWallet.generateId(pub, derivation);

  String get walletAssetId =>
      generateWalletAssetId(pub, derivation, symbol, protocol);
  static String generateWalletAssetId(
          String pub, String derivation, String symbol, Protocol protocol) =>
      '${DomainAsset.generateId(symbol, protocol)}:${DomainWallet.generateId(pub, derivation)}';

  @override
  List<Object?> get props => [
        symbol,
        protocol,
        sats,
        pub,
        derivation,
      ];

  @override
  List<String> get propNames => [
        'symbol',
        'protocol',
        'sats',
        'pub',
        'derivation',
      ];

  @override
  bool? get stringify => true;
}
