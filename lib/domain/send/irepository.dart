import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/send/entity.dart';
import 'package:moontree/domain/send/failure.dart';

abstract class ISendRepository {
  Future<Either<SendFailure, Send>> getSend();
  Future<Either<SendFailure, PubKeyAddress>> getChangeAddress();
}
