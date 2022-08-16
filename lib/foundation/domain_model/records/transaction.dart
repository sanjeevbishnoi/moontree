import 'package:equatable/equatable.dart';
import 'package:utils/mixins/string.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/domain_model/records/asset.dart';
import 'package:moontree/foundation/domain_model/records/wallet.dart';

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
    required this.fees,
    required this.ipfsHash,
    required this.note,
    required this.memo,
  });

  String get id => generateId(transactionHash, symbol, protocol, pub);
  static String generateId(String transactionHash, String symbol,
          Protocol protocol, String pub) =>
      '$transactionHash:$symbol:${protocol.name}:$pub';

  String get assetId => DomainAsset.generateId(symbol, protocol);
  String get walletId => DomainWallet.generateId(pub);

  String get walletAssetId => generateWalletAssetId(pub, symbol, protocol);
  static String generateWalletAssetId(
          String pub, String symbol, Protocol protocol) =>
      '${DomainAsset.generateId(symbol, protocol)}:${DomainWallet.generateId(pub)}';

  /* how to solve?
  factory DomainTransaction.from(
    TransactionDeviceRecord transaction,
    Protocol protocol,
  ) =>
      DomainTransaction(
        transactionHash: transaction., 
        type: transaction., 
        sentReceived: transaction., 
        sats: transaction., 
        height: transaction., 
        date: transaction., 
        symbol: transaction.symbol,
        protocol: protocol,
        pub: transaction., 
        fees: transaction.,
        ipfsHash: transaction., 
        note: transaction., 
        memo: transaction., 
      );
  */

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
