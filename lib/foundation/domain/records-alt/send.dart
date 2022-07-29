import 'package:equatable/equatable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/send/values.dart';
import 'package:moontree/domain/unspent/entity.dart';
import 'package:utils/mixins/string.dart';

class DomainTransaction with EquatableMixin, ToStringMixin {
  // link to
  final Holding holding;
  final Amount amount;
  final PubKeyAddress address;
  final PubKeyAddress change;
  final FeeSelection feeSelection;
  final Memo memo;
  final Note note;
  final bool sendAll;
  // link to
  final List<Unspent> assetUnspents;
  // link to
  final List<Unspent> ravenUnspents;

  DomainTransaction({
    required this.holding,
    required this.amount,
    required this.address,
    required this.change,
    required this.feeSelection,
    required this.memo,
    required this.note,
    required this.sendAll,
    required this.assetUnspents,
    required this.ravenUnspents,
  });

  @override
  List<Object?> get props => [
        holding,
        amount,
        address,
        change,
        feeSelection,
        memo,
        note,
        sendAll,
        assetUnspents,
        ravenUnspents,
      ];

  @override
  List<String> get propNames => [
        'holding',
        'amount',
        'address',
        'change',
        'feeSelection',
        'memo',
        'note',
        'sendAll',
        'assetUnspents',
        'ravenUnspents',
      ];

  @override
  bool? get stringify => true;

  factory DomainTransaction.from(dynamic x) => DomainTransaction(
        holding: x.holding,
        amount: x.amount,
        address: x.address,
        change: x.change,
        feeSelection: x.feeSelection,
        memo: x.memo,
        note: x.note,
        sendAll: x.sendAll,
        assetUnspents: x.assetUnspents,
        ravenUnspents: x.ravenUnspents,
      );

  String get id => 'send';
}
