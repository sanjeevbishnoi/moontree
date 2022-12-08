import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/transaction/failure.dart';
import 'package:moontree/domain/transaction/irepository.dart';
import 'package:moontree/domain/transaction/values.dart';
import 'package:moontree/domain/transaction/entity.dart';
import 'package:moontree/domain/transactionDetail/entity.dart';
import 'package:moontree/infrastructure/transactionDetail/repository.dart';

@Environment('prod')
@Injectable(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  const TransactionRepository();

  @override
  Future<Either<TransactionFailure, Transaction>> getTransaction() async {
    await Future<void>.delayed(Duration(milliseconds: Random().nextInt(10000)));
    return right(Transaction(
      txId: TxId(''),
      type: TxType(TxTypes.transfer),
      sentReceived: SentReceived.received,
      amount: Amount(1),
      confirmations: TxConfirmations(0),
      date: TxDate(DateTime.now()),
      transactionDetail: await const TransactionDetailRepository()
          .getTransactionDetail()
          .then((value) =>
              value.fold((l) => TransactionDetail.empty(), (r) => r)),
    ));
  }

  @override
  Future<Either<TransactionFailure, List<Transaction>>>
      getTransactions() async {
    return right([
      for (final tx in domain.transactions.records)
        Transaction(
          txId: TxId(tx.hash),
          type: TxType(tx.type),
          sentReceived: tx.sentReceived,
          amount: Amount(tx.amount),
          confirmations: TxConfirmations(
              0), // TxConfirmations(tx.confirmations), not captured yet
          date: TxDate(DateTime.now()), // TxDate(tx.date), not caputred yet
          transactionDetail: await const TransactionDetailRepository()
              .getTransactionDetailOf(tx)
              .then((value) =>
                  value.fold((l) => TransactionDetail.empty(), (r) => r)),
        ),
    ]);
  }
}
