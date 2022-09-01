// this interface is unused as of now. We always get a list of holdings.

import 'package:dartz/dartz.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/holding/failure.dart';

abstract class IHoldingRepository {
  Future<Either<HoldingFailure, Holding>>
      getHolding(); // should we specify the asset of holding?
  Future<Either<HoldingFailure, List<Holding>>> getHoldings();
}
