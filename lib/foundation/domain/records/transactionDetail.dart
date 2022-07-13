import 'package:equatable/equatable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/domain/transaction/values.dart';
import 'package:moontree/domain/transactionDetail/values.dart';
import 'package:utils/mixins/string.dart';

class DomainTransactionDetails with EquatableMixin, ToStringMixin {
  // link to transaction
  final TxId txId;
  final TxType type;
  final SentReceived sentReceived;
  final Amount amount;
  final TxConfirmations confirmations;
  final TxDate date;
  // link to holding
  final FullName fullName;
  final AssetType assetType;
  final Name name;
  // actual detials
  final Fees fees;
  final IpfsHash ipfsHash;
  final Note note;
  final Memo memo;

  DomainTransactionDetails({
    required this.txId,
    required this.type,
    required this.sentReceived,
    required this.amount,
    required this.confirmations,
    required this.date,
    required this.fullName,
    required this.assetType,
    required this.name,
    required this.fees,
    required this.ipfsHash,
    required this.note,
    required this.memo,
  });

  @override
  List<Object?> get props => [
        txId,
        type,
        sentReceived,
        amount,
        confirmations,
        date,
        fullName,
        assetType,
        name,
        fees,
        ipfsHash,
        note,
        memo,
      ];

  @override
  List<String> get propNames => [
        'txId',
        'type',
        'sentReceived',
        'amount',
        'confirmations',
        'date',
        'fullName',
        'assetType',
        'name',
        'fees',
        'ipfsHash',
        'note',
        'memo',
      ];

  @override
  bool? get stringify => true;

  factory DomainTransactionDetails.from(dynamic x) => DomainTransactionDetails(
        txId: x.txId,
        type: x.type,
        sentReceived: x.sentReceived,
        amount: x.amount,
        confirmations: x.confirmations,
        date: x.date,
        fullName: x.fullName,
        assetType: x.assetType,
        name: x.name,
        fees: x.fees,
        ipfsHash: x.ipfsHash,
        note: x.note,
        memo: x.memo,
      );

  String get id => txId.getOrCrash();
}
