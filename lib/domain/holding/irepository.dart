// this interface is unused as of now. We always get a list of holdings.

import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/holding/failure.dart';

abstract class IHoldingRepository {
  Future<Either<HoldingFailure, Holding>> getHolding();
  Future<Either<HoldingFailure, List<Holding>>> getHoldings();
}
