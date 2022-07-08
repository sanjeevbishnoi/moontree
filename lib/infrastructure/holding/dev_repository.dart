import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/holding/failure.dart';
import 'package:moontree/domain/holding/irepository.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/domain/transaction/entity.dart';
import 'package:moontree/infrastructure/transaction/dev_repository.dart';
import 'package:moontree/utils/dev.dart';

@Environment('dev')
@Injectable(as: IHoldingRepository)
class HoldingRepository implements IHoldingRepository {
  const HoldingRepository();

  @override
  Future<Either<HoldingFailure, Holding>> getHolding() async {
    await simulateWait('HoldingRepository');
    return right(Holding(
      fullName: FullName('MOONTREE!'),
      assetType: AssetType.admin,
      name: Name('Moontree'),
      amount: Amount(1),
      transactions: await const TransactionRepository()
          .getTransactions()
          .then((value) => value.fold((l) => [Transaction.empty()], (r) => r)),
    ));
  }

  @override
  Future<Either<HoldingFailure, List<Holding>>> getHoldings() async {
    await simulateWait('HoldingRepository');
    return right([
      Holding(
        fullName: FullName('technicalName'),
        name: Name('full name'),
        assetType: AssetType.unknown,
        amount: Amount(0.0),
        transactions: await const TransactionRepository()
            .getTransactions()
            .then(
                (value) => value.fold((l) => [Transaction.empty()], (r) => r)),
      ),
      Holding(
        fullName: FullName('RVN'),
        name: Name('Ravencoin'),
        assetType: AssetType.currency,
        amount: Amount(500.0),
        transactions: await const TransactionRepository()
            .getTransactions()
            .then(
                (value) => value.fold((l) => [Transaction.empty()], (r) => r)),
      ),
      Holding(
        fullName: FullName('MOONTREE'),
        name: Name('Moontree'),
        assetType: AssetType.main,
        amount: Amount(10.0),
        transactions: await const TransactionRepository()
            .getTransactions()
            .then(
                (value) => value.fold((l) => [Transaction.empty()], (r) => r)),
      ),
    ]);
  }
}
