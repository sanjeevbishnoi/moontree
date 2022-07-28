import 'package:equatable/equatable.dart';
import 'package:utils/mixins/string.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain/records/asset.dart';
import 'package:moontree/foundation/domain/records/transaction.dart';

class DomainHolding with EquatableMixin, ToStringMixin {
  // link to asset
  final FullName fullName;
  final AssetType assetType;
  final Name name;
  // amount
  final Amount amount;
  // link to
  final List<DomainTransaction> transactions;

  DomainHolding({
    required this.fullName,
    required this.assetType,
    required this.name,
    required this.amount,
    required this.transactions,
  });

  @override
  List<Object?> get props => [
        fullName,
        assetType,
        name,
        amount,
        transactions,
      ];

  @override
  List<String> get propNames => [
        'fullName',
        'assetType',
        'name',
        'amount',
        'transactions',
      ];

  @override
  bool? get stringify => true;

  factory DomainHolding.from(dynamic x) => DomainHolding(
        fullName: x.fullName,
        assetType: x.assetType,
        name: x.name,
        amount: x.amount,
        transactions: x.transactions,
      );
  factory DomainHolding.fromRecord(WalletBalanceDeviceRecord record) => DomainHolding(
      fullName: FullName(record.symbol),
      assetType: assetTypeOf(record.symbol),
      name: Name.fromFullName(record.symbol),
      amount: Amount.fromSats(record.sats),
      transactions: <DomainTransaction>[]

      /// we need to make all these ahead of time and just bring them in by
      /// wallet and symbol.
      //import 'package:moontree/domain/transaction/values.dart';
      //import 'package:moontree/foundation/data_model/joins/joins.dart';
      //import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as pros;
      //transactions: <DomainTransaction>[
      //  for (var vout in record.vouts)
      //    DomainTransaction(
      //      txId: TxId(vout.transactionHash),
      //      type: TxType(TxTypeOptions.unknown),
      //      sentReceived: SentReceived.received,
      //      amount: Amount.empty(),
      //      confirmations: /*current height - */ vout.transaction?.height ??
      //          0,
      //      date: date,
      //      transactionDetail: transactionDetail,
      //    )
      //],
      );
  factory DomainHolding.fromAssetAndAmountAndTransactions(DomainAsset asset,
          Amount amount, List<DomainTransaction> transactions) =>
      DomainHolding(
        fullName: asset.fullName,
        assetType: asset.assetType,
        name: asset.name,
        amount: amount,
        transactions: transactions,
      );

  // needs wallet id
  String get id => getId(fullName, assetType, amount);

  static String getId(FullName fullName, AssetType assetType, Amount amount) =>
      '${fullName.getOrCrash()}:${assetType.name}:${amount.getOrCrash()}';
}
