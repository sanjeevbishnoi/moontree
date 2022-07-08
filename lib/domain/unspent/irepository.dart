import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';
import 'package:moontree_layer_flutter/domain/unspent/failure.dart';

abstract class IUnspentRepository {
  Future<Either<UnspentFailure, Unspent>> getUnspent();
  Future<Either<UnspentFailure, List<Unspent>>> getUnspents([Holding? holding]);
}
