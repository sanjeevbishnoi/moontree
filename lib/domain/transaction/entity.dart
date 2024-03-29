import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/transaction/values.dart';
import 'package:moontree/domain/transactionDetail/entity.dart';

part 'entity.freezed.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required TxId txId,
    required TxType type,
    required SentReceived sentReceived,
    required Amount amount,
    required TxConfirmations confirmations,
    required TxDate date,
    required TransactionDetail transactionDetail,
  }) = _Transaction;

  factory Transaction.empty() => Transaction(
        txId: TxId(''),
        confirmations: TxConfirmations(0),
        type: TxType(TxTypes.transfer),
        sentReceived: SentReceived.sent,
        amount: Amount(0),
        date: TxDate(DateTime.now()),
        transactionDetail: TransactionDetail.empty(),
      );
}
