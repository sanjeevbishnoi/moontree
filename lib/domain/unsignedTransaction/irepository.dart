import 'package:dartz/dartz.dart';
import 'package:moontree/domain/send/entity.dart';
import 'package:moontree/domain/unsignedTransaction/entity.dart';
import 'package:moontree/domain/unsignedTransaction/failure.dart';

abstract class IUnsignedTransactionRepository {
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>>
      generateUnsignedTransaction(Send send);
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>>
      generateUnsignedTransactionAsset(Send send);
  Future<Either<UnsignedTransactionFailure, UnsignedTransaction>>
      generateUnsignedTransactionSweepOne(Send send);
}
