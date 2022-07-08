import 'package:moontree_layer_client/moontree_layer_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Address with HiveObjectMixin, EquatableMixin {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final int? walletId;

  @HiveField(2)
  final int? exposure;

  @HiveField(3)
  final int? hdIndex;

  @HiveField(4)
  final bool isUsed;

  @override
  List<Object?> get props => [
        address,
        walletId,
        exposure,
        hdIndex,
        isUsed,
      ];

  Address({
    required this.address,
    required this.walletId,
    required this.exposure,
    required this.hdIndex,
    required this.isUsed,
  });

  factory Address.from(client.Address address) => Address(
        address: address.address,
        walletId: address.wallet_id,
        exposure: address.exposure,
        hdIndex: address.hd_index,
        isUsed: address.is_used,
      );
}
