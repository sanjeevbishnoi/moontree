import 'package:equatable/equatable.dart';
import 'package:moontree/foundation/data_model/joins/joins.dart';
import 'package:utils/mixins/string.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
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

  /* a domain transaction is per asset, per wallet, per transaction hash.
  so it doesn't connect to multiple vouts unless they are all the same asset.
  */
  static List<DomainTransaction> from(
    TransactionDeviceRecord transaction,
    Protocol protocol,
  ) {
    final assets = {for (final vout in transaction.vouts) 
      (vout.asset) 
    };
    // get the asset
    // get the wallet
    // get the vins
    // get the vouts


    return DomainTransaction(
        transactionHash: transaction.hash, 
        height: transaction.height ?? -1, //0 is genesis block

        type: transaction., 
        sentReceived: transaction., 
        sats: transaction., 
        date: transaction., 
        symbol: transaction.symbol,
        protocol: protocol,
        pub: transaction., 
        fees: transaction.,
        ipfsHash: transaction., 
        note: transaction., 
        memo: transaction., 
      );
  }

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
