import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/send/values.dart';
import 'package:moontree/domain/unspent/entity.dart';
import 'package:moontree/utils/extensions/list.dart';

part 'entity.freezed.dart';

@freezed
abstract class Send with _$Send {
  const factory Send({
    required Holding holding,
    required Amount amount,
    required PubKeyAddress address,
    required PubKeyAddress change,
    required FeeSelection feeSelection,
    required Memo memo,
    required Note note,
    required bool sendAll,
    required List<Unspent> assetUnspents,
    required List<Unspent> ravenUnspents,
  }) = _Send;

  factory Send.empty() => Send(
        holding: Holding.empty(),
        amount: Amount.empty(),
        address: PubKeyAddress.empty(),
        change: PubKeyAddress.empty(),
        feeSelection: FeeSelection.unselected,
        memo: Memo.empty(),
        note: Note.empty(),
        sendAll: false,
        assetUnspents: [Unspent.empty()],
        ravenUnspents: [Unspent.empty()],
      );
}

extension ShortcutsForSend on Send {
  bool get isSendingRavencoin => holding.isRavencoin;
}

extension GuardConditionsForSend on Send {
  bool get hasNoRavencoin => ravenUnspents.sum() == Amount(0);
  bool get amountTooLarge =>
      (isSendingRavencoin && amount >= ravenUnspents.sum()) ||
      (!isSendingRavencoin && amount >= assetUnspents.sum());
}
