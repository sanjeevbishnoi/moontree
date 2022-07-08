// this interface is unused as of now. We always get a list of holdings.

import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/transaction/entity.dart';
import 'package:moontree_layer_flutter/domain/transaction/failure.dart';

abstract class ITransactionRepository {
  Future<Either<TransactionFailure, Transaction>> getTransaction();
  Future<Either<TransactionFailure, List<Transaction>>> getTransactions();
}
