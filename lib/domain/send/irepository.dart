import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/send/entity.dart';
import 'package:moontree_layer_flutter/domain/send/failure.dart';

abstract class ISendRepository {
  Future<Either<SendFailure, Send>> getSend();
  Future<Either<SendFailure, PubKeyAddress>> getChangeAddress();
}
