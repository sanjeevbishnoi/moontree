import 'package:equatable/equatable.dart';
import 'package:moontree_utils/mixins/string.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/data_model/joins/joins.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
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
  final Protocols protocol;

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
          String transactionHash, int position, Protocols protocol) =>
      '$transactionHash:$position:${protocol.name}';

  String get assetId => DomainAsset.generateId(symbol, protocol);
  String get walletId => DomainWallet.generateId(pub);

  String get walletAssetId => generateWalletAssetId(pub, symbol, protocol);
  static String generateWalletAssetId(
          String pub, String symbol, Protocols protocol) =>
      '${DomainAsset.generateId(symbol, protocol)}:${DomainWallet.generateId(pub)}';

  static List<DomainUnspent> from(VoutRecord vout, Protocols protocol) =>
      vout.unspent && vout.vin == null // verify
          ? [
              for (final wallet
                  in (vout.toAddress?.wallets.toList() ?? []).toSet())
                DomainUnspent(
                  transactionHash: vout.transactionHash,
                  position: vout.position,
                  address: vout.address,
                  sats: vout.sats,
                  lockingScript: vout.lockingScript,
                  symbol: vout.symbol,
                  protocol: protocol,
                  pub: wallet.pubkey,
                )
            ]
          : [];

  @override
  List<Object?> get props => <Object?>[
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
