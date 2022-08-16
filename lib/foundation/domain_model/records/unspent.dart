import 'package:equatable/equatable.dart';
import 'package:utils/mixins/string.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain_model/records/asset.dart';
import 'package:moontree/foundation/domain_model/records/wallet.dart';

class DomainUnspent with EquatableMixin, ToStringMixin {
  final String transactionHash;
  final int position;
  final String address;
  final int sats;
  final String lockingScript;
  // link to asset
  final String symbol;
  final Protocol protocol;

  /// optimization...
  // link to wallet instead of through address
  final String pub;

  DomainUnspent({
    required this.transactionHash,
    required this.position,
    required this.address,
    required this.sats,
    required this.lockingScript,
    required this.symbol,
    required this.protocol,
    required this.pub,
  });

  String get id => generateId(transactionHash, position, protocol);
  static String generateId(
          String transactionHash, int position, Protocol protocol) =>
      '$transactionHash:$position:${protocol.name}';

  String get assetId => DomainAsset.generateId(symbol, protocol);
  String get walletId => DomainWallet.generateId(pub);

  String get walletAssetId => generateWalletAssetId(pub, symbol, protocol);
  static String generateWalletAssetId(
          String pub, String symbol, Protocol protocol) =>
      '${DomainAsset.generateId(symbol, protocol)}:${DomainWallet.generateId(pub)}';

  @override
  List<Object?> get props => [
        transactionHash,
        position,
        address,
        sats,
        lockingScript,
        symbol,
        protocol,
        pub,
      ];

  @override
  List<String> get propNames => [
        'transactionHash',
        'position',
        'address',
        'sats',
        'lockingScript',
        'symbol',
        'protocol',
        'pub',
      ];

  @override
  bool? get stringify => true;
}
