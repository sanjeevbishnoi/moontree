import 'package:dartz/dartz.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/unspent/entity.dart';
import 'package:moontree/domain/unspent/failure.dart';

abstract class IUnspentRepository {
  Future<Either<UnspentFailure, Unspent>> getUnspent();
  Future<Either<UnspentFailure, List<Unspent>>> getUnspents([Holding? holding]);
}
