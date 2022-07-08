import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/unspent/values.dart';

part 'entity.freezed.dart';

@freezed
abstract class Unspent with _$Unspent {
  const factory Unspent({
    required TxId txId,
    required TxPosition position,
    required PubKeyAddress toAddress,
    required Amount amount,
    required LockingScript lockingScript,
  }) = _Unspent;

  factory Unspent.empty() => Unspent(
        txId: TxId.empty(),
        position: TxPosition.empty(),
        toAddress: PubKeyAddress.empty(),
        amount: Amount.empty(),
        lockingScript: LockingScript.empty(),
      );
}
