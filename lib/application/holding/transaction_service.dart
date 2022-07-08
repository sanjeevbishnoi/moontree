import 'package:moontree_layer_flutter/domain/transaction/entity.dart';
import 'package:moontree_layer_flutter/domain/transaction/values.dart';

String getDateType(Transaction transaction) {
  final date = getDate(transaction);
  final type = getType(transaction);
  return type == '' ? date : '$date | $type';
}

String getDate(Transaction transaction) {
  final r = transaction;
  return r.confirmations.isMempool ? 'In Transit' : r.date.asString();
}

String getType(Transaction transaction) => transaction.type.asText;

bool getReceived(Transaction transaction) =>
    transaction.sentReceived == SentReceived.received;

String getAmount(Transaction transaction) => transaction.amount.value.fold(
      (l) => 'unknown',
      (r) => r.toString(),
    );
