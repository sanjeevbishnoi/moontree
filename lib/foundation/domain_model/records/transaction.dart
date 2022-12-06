/// an attempt at a interim transaction object.
import 'package:equatable/equatable.dart';
import 'package:moontree/foundation/data_model/joins/joins.dart';
import 'package:moontree_utils/extensions/extensions.dart';
import 'package:moontree_utils/mixins/string.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/records/asset.dart';
import 'package:moontree/foundation/domain_model/records/wallet.dart';
import 'package:wallet_utils/wallet_utils.dart' as networks;

class DomainTransaction with EquatableMixin, ToStringMixin {
  // connect to a wallet or address?
  final String hash;
  final int height;
  final int fee;
  // asset
  final String symbol;
  final Protocols protocol;
  // wallet
  final String pub;

  DomainTransaction({
    required this.hash,
    required this.height,
    required this.symbol,
    required this.protocol,
    required this.pub,
    required this.fee,
  });

  int? _sats;
  TxTypes? _type;
  late Iterable<VinRecord> _vins;
  late Iterable<VoutRecord> _vouts;
  late WalletRecord _wallet;

  String get id => generateId(hash, symbol, protocol, pub);
  static String generateId(
          String hash, String symbol, Protocols protocol, String pub) =>
      '$hash:$symbol:${protocol.name}:$pub';

  String get assetId => DomainAsset.generateId(symbol, protocol);
  String get walletId => DomainWallet.generateId(pub);

  String get walletAssetId => generateWalletAssetId(pub, symbol, protocol);
  static String generateWalletAssetId(
          String pub, String symbol, Protocols protocol) =>
      '${DomainAsset.generateId(symbol, protocol)}:${DomainWallet.generateId(pub)}';

  /* a domain transaction is per asset, per wallet, per transaction hash.
  so it doesn't connect to multiple vouts unless they are all the same asset.
  */
  static List<DomainTransaction> from(
    TransactionRecord transaction,
    Protocols protocol,
  ) {
    final wallets = [
      for (final vout in transaction.vouts) vout.toAddress!.wallets
    ].expand((i) => i).toSet();
    final symbols = {for (final vout in transaction.vouts) vout.symbol};

    // get fee
    var rvnIn = 0;
    var rvnOut = 0;
    for (final vin in transaction.rvnVins) {
      final vinVout = vin.vout;
      // here we have a situation. A vin that is a coinbase doesn't have
      // sats associated with it. of course coinbase transactions only have
      // one vin and one vout I think so... we can just look at the vout of
      // the transaction to know the fee.
      if (vinVout == null) {
        rvnIn += transaction.vouts.first.sats;
      } else {
        rvnIn += vinVout.sats;
      }
    }
    for (final vout in transaction.rvnVouts) {
      rvnOut += vout.sats;
    }

    final fee = rvnIn - rvnOut;

    /// use fee...

    // make a domain transaction for each asset, per wallet:
    // get self and other inputs and self and other outputs
    var retObjects = <DomainTransaction>[];
    for (final wallet in wallets) {
      for (String symbol in symbols) {
        var x = DomainTransaction(
          hash: transaction.hash,
          height: transaction.height ?? -1, //0 is genesis block
          symbol: symbol,
          protocol: protocol,
          pub: wallet.pubkey,
          fee: fee,
        );
        x.setWallet(wallet);
        x.setVins(transaction.vins.where((vin) => vin.symbol == symbol));
        x.setVouts(transaction.vouts.where((vout) => vout.symbol == symbol));
        x.sats; // calculate and save sats
        x.type; // calculate and save type
        retObjects.add(x);
      }
    }
    return retObjects;
  }

  setWallet(WalletRecord wallet) => _wallet = wallet;
  setVins(Iterable<VinRecord> vins) => _vins = vins;
  setVouts(Iterable<VoutRecord> vouts) => _vouts = vouts;

  @override
  List<Object?> get props => <Object?>[
        hash,
        height,
        symbol,
        protocol,
        fee,
        pub,
      ];

  @override
  List<String> get propNames => [
        'hash',
        'height',
        'symbol',
        'protocol',
        'fee',
        'pub',
      ];

  @override
  bool? get stringify => true;

  String get transactionHash => hash;

  int get sats {
    _sats ??= _vins
            .where((v) => _wallet.rawAddresses.contains(v.address))
            .fold(0, (int sum, v) => sum + v.sats) -
        _vouts
            .where((v) => _wallet.rawAddresses.contains(v.address))
            .fold(0, (int sum, v) => sum + v.sats);
    return _sats!;
  }

  double get amount => sats.toAmount();
  double get feeAmount => fee.toAmount();

  SentReceived get sentReceived =>
      sats > 0 ? SentReceived.received : SentReceived.sent;

  /// logic on vins and vouts to determin type
  TxTypes get type {
    _type ??= () {
      final addresses = _vouts.map((v) => v.address).toSet();
      final net = (p) {
        switch (p) {
          case Protocols.ravencoinMainnet:
            return networks.mainnet;
          case Protocols.ravencoinTestnet:
            return networks.testnet;
          default:
            return networks.mainnet;
        }
      }(protocol);
      if (addresses.contains(net.burnAddresses.addTag)) {
        return TxTypes.tag;
      } else if (addresses.contains(net.burnAddresses.reissue)) {
        return TxTypes.reissue;
      } else if (addresses.toSet().intersection({
        net.burnAddresses.issueMain,
        net.burnAddresses.issueQualifier,
        net.burnAddresses.issueRestricted,
        net.burnAddresses.issueSub,
        net.burnAddresses.issueSubQualifier,
        net.burnAddresses.issueUnique,
        net.burnAddresses.issueMessage,
      }).isNotEmpty) {
        return TxTypes.creation;
      } else if (addresses.contains(net.burnAddresses.burn)) {
        return TxTypes.burn;
        /* dividend
    } else if (addresses.contains(net.burnAddresses.???)) {
      return TxType.dividend;
    } else if (addresses.contains(net.burnAddresses.???)) {
      return TxType.message;
    */
      } else if (symbol == 'RVN' && sats == fee) {
        return TxTypes.fee;
      } else if ((symbol != 'RVN' && sats == 0) ||
          (symbol == 'RVN' && sats + fee == 0)) {
        return TxTypes.self;
      } else if (sats != 0) {
        return TxTypes.transfer;
      }
      return TxTypes.unknown;
    }();
    return _type!;
  }

  /// where should these come from?
  //DateTime get date => ;
  //String get ipfsHash => ;
  //String get note => ;
  //String get memo => ;

}
