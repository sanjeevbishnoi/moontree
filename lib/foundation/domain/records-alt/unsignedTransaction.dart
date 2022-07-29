import 'package:equatable/equatable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/unsignedTransaction/values.dart';
import 'package:moontree/domain/unspent/entity.dart';
import 'package:utils/mixins/string.dart';

class DomainUnsignedTransaction with EquatableMixin, ToStringMixin {
  final bool signed;
  final Amount fee;
  final TxHash txHash;
  final dynamic txBuilder;
  final dynamic tx;
  final List<Unspent> chosenUnspents;

  DomainUnsignedTransaction({
    required this.signed,
    required this.fee,
    required this.txHash,
    required this.txBuilder,
    required this.tx,
    required this.chosenUnspents,
  });

  @override
  List<Object?> get props => [
        signed,
        fee,
        txHash,
        txBuilder,
        tx,
        chosenUnspents,
      ];

  @override
  List<String> get propNames => [
        'signed',
        'fee',
        'txHash',
        'txBuilder',
        'tx',
        'chosenUnspent',
      ];

  @override
  bool? get stringify => true;

  factory DomainUnsignedTransaction.from(dynamic x) =>
      DomainUnsignedTransaction(
        signed: x.signed,
        fee: x.fee,
        txHash: x.txHash,
        txBuilder: x.txBuilder,
        tx: x.tx,
        chosenUnspents: x.chosenUnspents,
      );

  String get id => 'unsignedTransaction';
}
