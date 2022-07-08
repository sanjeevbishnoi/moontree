// this interface is unused as of now. We always get a list of holdings.

import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/transactionDetail/entity.dart';
import 'package:moontree_layer_flutter/domain/transactionDetail/failure.dart';

abstract class ITransactionDetailRepository {
  Future<Either<TransactionDetailFailure, TransactionDetail>>
      getTransactionDetail();
}
