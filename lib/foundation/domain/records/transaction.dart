import 'package:equatable/equatable.dart';
import 'package:moontree/foundation/domain/records/asset.dart';
import 'package:moontree/foundation/domain/records/wallet.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:utils/mixins/string.dart';

class DomainTransaction with EquatableMixin, ToStringMixin {
  // connect to a wallet or address?
  final String transactionHash;
  final TxType type;
  final SentReceived sentReceived;
  final int sats;
  final int height;
  final DateTime date;
  // asset
  final String symbol;
  final Protocol protocol;
  // wallet
  final String pub;
  final String derivation;
  // details
  final Map<FeeType, int> fees;
  final String ipfsHash;
  final String note;
  final String memo;

  DomainTransaction({
    required this.transactionHash,
    required this.type,
    required this.sentReceived,
    required this.sats,
    required this.height,
    required this.date,
    required this.symbol,
    required this.protocol,
    required this.pub,
    required this.derivation,
    required this.fees,
    required this.ipfsHash,
    required this.note,
    required this.memo,
  });

  String get id =>
      generateId(transactionHash, symbol, protocol, pub, derivation);
  static String generateId(String transactionHash, String symbol,
          Protocol protocol, String pub, String derviation) =>
      '$transactionHash:$symbol:${protocol.name}:$pub:$derviation';

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
        type,
        sentReceived,
        sats,
        height,
        date,
        symbol,
        protocol,
        fees,
        ipfsHash,
        note,
        memo,
      ];

  @override
  List<String> get propNames => [
        'transactionHash',
        'type',
        'sentReceived',
        'sats',
        'height',
        'date',
        'symbol',
        'protocol',
        'fees',
        'ipfsHash',
        'note',
        'memo',
      ];

  @override
  bool? get stringify => true;
}
