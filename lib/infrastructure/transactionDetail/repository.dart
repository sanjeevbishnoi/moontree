import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/domain/transaction/values.dart';
import 'package:moontree/domain/transactionDetail/failure.dart';
import 'package:moontree/domain/transactionDetail/irepository.dart';
import 'package:moontree/domain/transactionDetail/values.dart';
import 'package:moontree/domain/transactionDetail/entity.dart';

@Environment('prod')
@Injectable(as: ITransactionDetailRepository)
class TransactionDetailRepository implements ITransactionDetailRepository {
  const TransactionDetailRepository();

  @override
  Future<Either<TransactionDetailFailure, TransactionDetail>>
      getTransactionDetail() async {
    await Future.delayed(Duration(milliseconds: Random().nextInt(10000)));
    return right(
      TransactionDetail(
        txId: TxId(
            'd6a0532aff8d1c075e5cb97ae595e4323c909bc527dcad86321cc074b4c12adc'),
        type: TxType(TxTypes.transfer),
        sentReceived: SentReceived.received,
        amount: Amount(0.0),
        confirmations: TxConfirmations(0),
        date: TxDate(DateTime.now()),
        fullName: FullName('RVN'),
        assetType: AssetType.currency,
        name: Name('Ravencoin'),
        fees: Fees({}),
        ipfsHash: IpfsHash(''),
        note: Note(''),
        memo: Memo(''),
      ),
    );
  }
}
