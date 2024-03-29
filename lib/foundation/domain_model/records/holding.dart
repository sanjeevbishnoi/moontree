import 'package:equatable/equatable.dart';
import 'package:moontree_utils/mixins/string.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/records/asset.dart';
import 'package:moontree/foundation/domain_model/records/wallet.dart';
import 'package:wallet_utils/wallet_utils.dart';

class DomainHolding with EquatableMixin, ToStringMixin {
  // holdings point to an domain asset by symbol
  final String symbol;
  final Protocols protocol;
  // amount
  final int sats;
  // link to (transactions point to a holding)
  //final List<DomainTransaction> transactions;
  // must point to wallet too:
  final String pub;

  DomainHolding({
    required this.symbol,
    required this.protocol,
    required this.sats,
    required this.pub,
  });

  String get id => generateId(symbol, protocol, pub);
  static String generateId(String symbol, Protocols protocol, String pub) =>
      '$symbol:${protocol.name}:$pub';

  String get assetId => DomainAsset.generateId(symbol, protocol);
  String get walletId => DomainWallet.generateId(pub);

  String get walletAssetId => generateWalletAssetId(pub, symbol, protocol);
  static String generateWalletAssetId(
          String pub, String symbol, Protocols protocol) =>
      '${DomainAsset.generateId(symbol, protocol)}:${DomainWallet.generateId(pub)}';

  factory DomainHolding.from(
    WalletBalanceRecord balance,
    Protocols protocol,
  ) =>
      DomainHolding(
        symbol: balance.symbol,
        protocol: protocol,
        sats: balance.sats,
        pub: balance.pubkey,
      );

  @override
  List<Object?> get props => <Object?>[
        symbol,
        protocol,
        sats,
        pub,
      ];

  @override
  List<String> get propNames => [
        'symbol',
        'protocol',
        'sats',
        'pub',
      ];

  @override
  bool? get stringify => true;

  double get amount => sats.asCoin;
}
