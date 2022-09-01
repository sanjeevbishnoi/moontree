import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree/domain/transaction/entity.dart';
import 'package:moontree/foundation/domain_model/joins/joins.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/holding/failure.dart';
import 'package:moontree/domain/holding/irepository.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/infrastructure/transaction/repository.dart';

@Environment('prod')
@Injectable(as: IHoldingRepository)
class HoldingRepository implements IHoldingRepository {
  const HoldingRepository();

  @override
  Future<Either<HoldingFailure, Holding>> getHolding() async {
    await Future.delayed(Duration(milliseconds: Random().nextInt(10000)));
    return right(Holding(
        fullName: FullName(''),
        assetType: AssetType.unknown,
        name: Name(''),
        amount: Amount(0),
        transactions: []));
  }

  @override
  Future<Either<HoldingFailure, List<Holding>>> getHoldings() async {
    return right([
      for (var record in domain.holdings.records)
        Holding(
          fullName: FullName(record.symbol),
          name: Name(record.asset.name),
          assetType: record.asset.assetType,
          amount: Amount(record.amount),
          transactions: await const TransactionRepository()
              .getTransactions()
              .then((value) =>
                  value.fold((l) => [Transaction.empty()], (r) => r)),
        ),
    ]);
  }
}
