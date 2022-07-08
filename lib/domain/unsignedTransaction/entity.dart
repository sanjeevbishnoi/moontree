import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/values.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';

part 'entity.freezed.dart';

@freezed
abstract class UnsignedTransaction with _$UnsignedTransaction {
  const factory UnsignedTransaction({
    required bool signed,
    required Amount fee,
    required TxHash txHash,
    required dynamic txBuilder,
    required dynamic tx,
    required List<Unspent> chosenUnspents,
  }) = _UnsignedTransaction;

  factory UnsignedTransaction.empty() => UnsignedTransaction(
        signed: false,
        fee: Amount(0),
        txHash: TxHash(''),
        txBuilder: null,
        tx: null,
        chosenUnspents: <Unspent>[],
      );
}
