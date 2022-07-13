import 'package:equatable/equatable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/transaction/values.dart';
import 'package:moontree/domain/transactionDetail/entity.dart';
import 'package:utils/mixins/string.dart';

class DomainTransaction with EquatableMixin, ToStringMixin {
  // connect to a wallet or address?
  final TxId txId;
  final TxType type;
  final SentReceived sentReceived;
  final Amount amount;
  final TxConfirmations confirmations;
  final TxDate date;
  final TransactionDetail transactionDetail;

  DomainTransaction({
    required this.txId,
    required this.type,
    required this.sentReceived,
    required this.amount,
    required this.confirmations,
    required this.date,
    required this.transactionDetail,
  });

  @override
  List<Object?> get props => [
        txId,
        type,
        sentReceived,
        amount,
        confirmations,
        date,
        transactionDetail,
      ];

  @override
  List<String> get propNames => [
        'txId',
        'type',
        'sentReceived',
        'amount',
        'confirmations',
        'date',
        'transactionDetail',
      ];

  @override
  bool? get stringify => true;

  factory DomainTransaction.from(dynamic x) => DomainTransaction(
        txId: x.txId,
        type: x.type,
        sentReceived: x.sentReceived,
        amount: x.amount,
        confirmations: x.confirmations,
        date: x.date,
        transactionDetail: x.transactionDetail,
      );

  String get id => txId.getOrCrash();
}
