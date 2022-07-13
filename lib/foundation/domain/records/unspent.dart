import 'package:equatable/equatable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/unspent/values.dart';
import 'package:utils/mixins/string.dart';

class DomainUnspent with EquatableMixin, ToStringMixin {
  final TxId txId;
  final TxPosition position;
  final PubKeyAddress toAddress;
  final Amount amount;
  final LockingScript lockingScript;

  DomainUnspent({
    required this.txId,
    required this.position,
    required this.toAddress,
    required this.amount,
    required this.lockingScript,
  });

  @override
  List<Object?> get props => [
        txId,
        position,
        toAddress,
        amount,
        lockingScript,
      ];

  @override
  List<String> get propNames => [
        'txId',
        'position',
        'toAddress',
        'amount',
        'lockingScript',
      ];

  @override
  bool? get stringify => true;

  factory DomainUnspent.from(dynamic x) => DomainUnspent(
        txId: x.txId,
        position: x.position,
        toAddress: x.toAddress,
        amount: x.amount,
        lockingScript: x.lockingScript,
      );

  String get id => '${txId.getOrCrash()}:${position.getOrCrash()}';
}
