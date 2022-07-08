import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/holding/failure.dart';
import 'package:moontree_layer_flutter/domain/holding/irepository.dart';
import 'package:moontree_layer_flutter/domain/holding/values.dart';

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
  Future<Either<HoldingFailure, List<Holding>>> getHoldings() {
    // TODO: implement getHoldings
    throw UnimplementedError();
  }
}
