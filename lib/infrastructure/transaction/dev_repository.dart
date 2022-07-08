import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/transaction/failure.dart';
import 'package:moontree_layer_flutter/domain/transaction/irepository.dart';
import 'package:moontree_layer_flutter/domain/transaction/values.dart';
import 'package:moontree_layer_flutter/domain/transaction/entity.dart';
import 'package:moontree_layer_flutter/domain/transactionDetail/entity.dart';
import 'package:moontree_layer_flutter/infrastructure/transactionDetail/dev_repository.dart';
import 'package:moontree_layer_flutter/utils/dev.dart';

@Environment('dev')
@Injectable(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  const TransactionRepository();

  @override
  Future<Either<TransactionFailure, Transaction>> getTransaction() async {
    await simulateWait('TransactionRepository');
    return right(Transaction(
      txId: TxId(
          'd6a0532aff8d1c075e5cb97ae595e4323c909bc527dcad86321cc074b4c12adc'),
      type: TxType(TxTypeOptions.transfer),
      sentReceived: SentReceived.received,
      amount: Amount(1),
      confirmations: TxConfirmations(100),
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
    await simulateWait('TransactionRepository');
    return right([
      Transaction(
        txId: TxId(
            'd6a0532aff8d1c075e5cb97ae595e4323c909bc527dcad86321cc074b4c12adc'),
        type: TxType(TxTypeOptions.transfer),
        sentReceived: SentReceived.sent,
        amount: Amount(1),
        confirmations: TxConfirmations(0),
        date: TxDate(DateTime.now()),
        transactionDetail: await const TransactionDetailRepository()
            .getTransactionDetail()
            .then((value) =>
                value.fold((l) => TransactionDetail.empty(), (r) => r)),
      ),
      Transaction(
        txId: TxId(
            'd6a0532aff8d1c075e5cb97ae595e4323c909bc527dcad86321cc074b4c12adc'),
        type: TxType(TxTypeOptions.transfer),
        sentReceived: SentReceived.received,
        amount: Amount(100),
        confirmations: TxConfirmations(100),
        date: TxDate(DateTime.now()),
        transactionDetail: await const TransactionDetailRepository()
            .getTransactionDetail()
            .then((value) =>
                value.fold((l) => TransactionDetail.empty(), (r) => r)),
      ),
      Transaction(
        txId: TxId(
            'd6a0532aff8d1c075e5cb97ae595e4323c909bc527dcad86321cc074b4c12adc'),
        type: TxType(TxTypeOptions.reissue),
        sentReceived: SentReceived.received,
        amount: Amount(100),
        confirmations: TxConfirmations(100),
        date: TxDate(DateTime.now()),
        transactionDetail: await const TransactionDetailRepository()
            .getTransactionDetail()
            .then((value) =>
                value.fold((l) => TransactionDetail.empty(), (r) => r)),
      )
    ]);
  }
}
