import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:utils/mixins/string.dart';

class Vout with HiveObjectMixin, EquatableMixin, ToStringMixin {
  @HiveField(0)
  final int transactionId;

  @HiveField(1)
  final int? assetId;

  @HiveField(2)
  final int? addressId;

  @HiveField(3)
  final int idx;

  @HiveField(4)
  final int sats;

  @HiveField(5)
  final String lockingScript;

  @HiveField(6)
  final String? assetMemo;

  @HiveField(7)
  final int? assetMemoTimestamp;

  Vout({
    required this.transactionId,
    required this.assetId,
    required this.addressId,
    required this.idx,
    required this.sats,
    required this.lockingScript,
    required this.assetMemo,
    required this.assetMemoTimestamp,
  });

  @override
  List<Object?> get props => [
        transactionId,
        assetId,
        addressId,
        idx,
        sats,
        lockingScript,
        assetMemo,
        assetMemoTimestamp,
      ];

  @override
  List<String> get propNames => [
        'transactionId',
        'assetId',
        'addressId',
        'idx',
        'sats',
        'lockingScript',
        'assetMemo',
        'assetMemoTimestamp',
      ];

  @override
  bool? get stringify => true;

  factory Vout.from(client.Vout vout) => Vout(
        transactionId: vout.transaction_id,
        assetId: vout.asset_id,
        addressId: vout.address_id,
        idx: vout.idx,
        sats: vout.sats,
        lockingScript: vout.locking_script,
        assetMemo: vout.asset_memo,
        assetMemoTimestamp: vout.asset_memo_timestamp,
      );
}
