import 'package:equatable/equatable.dart';
import 'package:moontree/foundation/domain/records/asset.dart';
import 'package:moontree/foundation/domain/records/wallet.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:utils/mixins/string.dart';

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
  final String derivation;

  DomainUnspent({
    required this.transactionHash,
    required this.position,
    required this.address,
    required this.sats,
    required this.lockingScript,
    required this.symbol,
    required this.protocol,
    required this.pub,
    required this.derivation,
  });

  String get id => generateId(transactionHash, position, protocol);
  static String generateId(
          String transactionHash, int position, Protocol protocol) =>
      '$transactionHash:$position:${protocol.name}';

  String get assetId => DomainAsset.generateId(symbol, protocol);
  String get walletId => DomainWallet.generateId(pub, derivation);

  String get walletAssetId =>
      generateWalletAssetId(pub, derivation, symbol, protocol);
  static String generateWalletAssetId(
          String pub, String derivation, String symbol, Protocol protocol) =>
      '${DomainAsset.generateId(symbol, protocol)}:${DomainWallet.generateId(pub, derivation)}';

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
        derivation,
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
        'derivation',
      ];

  @override
  bool? get stringify => true;
}
