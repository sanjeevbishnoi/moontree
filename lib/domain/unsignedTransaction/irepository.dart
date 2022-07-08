import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/send/entity.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/entity.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/failure.dart';

abstract class IUnsignedTransactionRepository {
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>>
      generateUnsignedTransaction(Send send);
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>>
      generateUnsignedTransactionAsset(Send send);
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>>
      generateUnsignedTransactionSweepOne(Send send);
}
