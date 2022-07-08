import 'package:dartz/dartz.dart';
import 'package:moontree/domain/blockchain/entity.dart';
import 'package:moontree/domain/blockchain/failure.dart';

abstract class IBlockchainRepository {
  Future<Either<BlockchainFailure, Blockchain>> getBlockchain();
}
