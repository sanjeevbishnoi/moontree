/// since we want to be able to see the nested entity object, we'll put those
/// calls here in a separate service called by the cubit.

import 'package:moontree_layer_flutter/domain/transaction/values.dart';
import 'package:moontree_layer_flutter/domain/transactionDetail/entity.dart';
import 'package:moontree_layer_flutter/utils/extensions/string.dart';

String getTxId(TransactionDetail transactionDetail) =>
    transactionDetail.txId.value.fold(
      (l) => 'unknown',
      (r) => r,
    );

String getAmount(TransactionDetail transactionDetail) =>
    transactionDetail.amount.value.fold(
      (l) => 'unknown',
      (r) => r.toString(),
    );

String getDetailDateType(TransactionDetail transactionDetail) {
  final date = getDate(transactionDetail);
  final type = getType(transactionDetail);
  return type == '' ? date : '$date | $type';
}

String getDate(TransactionDetail transactionDetail) {
  final r = transactionDetail;
  return r.confirmations.isMempool ? 'In Transit' : r.date.asString();
}

String getType(TransactionDetail transactionDetail) =>
    transactionDetail.type.value
        .fold((l) => 'unknown', (r) => r.name.toTitleCase());
bool isReceived(TransactionDetail transactionDetail) =>
    transactionDetail.sentReceived == SentReceived.received;
int getConfirmations(TransactionDetail transactionDetail) =>
    transactionDetail.confirmations.value.fold((l) => 0, (r) => r);
String getFullName(TransactionDetail transactionDetail) =>
    transactionDetail.fullName.value.fold((l) => 'unknown', (r) => r);
String getName(TransactionDetail transactionDetail) =>
    transactionDetail.name.value.fold((l) => 'unknown', (r) => r);
String getAssetType(TransactionDetail transactionDetail) =>
    transactionDetail.assetType.name.toTitleCase();
Map<String, double> getFees(TransactionDetail transactionDetail) =>
    transactionDetail.fees.unpack();
String getTransactionFee(TransactionDetail transactionDetail) =>
    transactionDetail.fees.transactionFee.toString();
String getIpfsHash(TransactionDetail transactionDetail) =>
    transactionDetail.ipfsHash.value.fold((l) => 'unknown', (r) => r);
String getMemo(TransactionDetail transactionDetail) =>
    transactionDetail.memo.value.fold((l) => 'unknown', (r) => r);
String getNote(TransactionDetail transactionDetail) =>
    transactionDetail.note.value.fold((l) => 'unknown', (r) => r);
