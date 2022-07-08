import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/blockchain/entity.dart';
import 'package:moontree_layer_flutter/domain/blockchain/failure.dart';

abstract class IBlockchainRepository {
  Future<Either<BlockchainFailure, Blockchain>> getBlockchain();
}
