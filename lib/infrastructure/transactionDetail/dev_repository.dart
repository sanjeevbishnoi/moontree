import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_utils/moontree_utils.dart' show simulateWait;
import 'package:moontree/foundation/domain_model/records/transaction.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/domain/transaction/values.dart';
import 'package:moontree/domain/transactionDetail/failure.dart';
import 'package:moontree/domain/transactionDetail/irepository.dart';
import 'package:moontree/domain/transactionDetail/values.dart';
import 'package:moontree/domain/transactionDetail/entity.dart';

@Environment('dev')
@Injectable(as: ITransactionDetailRepository)
class TransactionDetailRepository implements ITransactionDetailRepository {
  const TransactionDetailRepository();

  @override
  Future<Either<TransactionDetailFailure, TransactionDetail>>
      getTransactionDetail() async {
    await simulateWait('TransactionDetailRepository');
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
        fees: Fees({FeeType.transaction: Amount(0)}),
        ipfsHash: IpfsHash(''),
        note: Note(''),
        memo: Memo(''),
      ),
    );
  }

  @override
  Future<Either<TransactionDetailFailure, TransactionDetail>>
      getTransactionDetailOf(DomainTransaction tx) async {
    // TODO: implement getHoldings
    throw UnimplementedError();
  }
}
