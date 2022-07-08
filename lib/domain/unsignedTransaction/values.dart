import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/core/value_object.dart';
import 'package:moontree_layer_flutter/domain/core/value_failures.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/validators.dart';

class TxHash extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const TxHash._(this.value);

  factory TxHash(String txHash) => TxHash._(validateTxHash(txHash));
  factory TxHash.empty() => TxHash('');
}
