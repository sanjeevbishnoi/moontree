import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/transaction/failure.dart';
import 'package:moontree_layer_flutter/domain/transaction/irepository.dart';
import 'package:moontree_layer_flutter/domain/transaction/values.dart';
import 'package:moontree_layer_flutter/domain/transaction/entity.dart';
import 'package:moontree_layer_flutter/domain/transactionDetail/entity.dart';
import 'package:moontree_layer_flutter/infrastructure/transactionDetail/repository.dart';

@Environment('prod')
@Injectable(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  const TransactionRepository();

  @override
  Future<Either<TransactionFailure, Transaction>> getTransaction() async {
    await Future.delayed(Duration(milliseconds: Random().nextInt(10000)));
    return right(Transaction(
      txId: TxId(''),
      type: TxType(TxTypeOptions.transfer),
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
  Future<Either<TransactionFailure, List<Transaction>>> getTransactions() {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }
}
