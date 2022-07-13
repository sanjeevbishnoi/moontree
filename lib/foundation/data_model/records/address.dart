import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:utils/mixins/string.dart';

class Address with HiveObjectMixin, EquatableMixin, ToStringMixin {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final String walletPubKey;

  @HiveField(2)
  final int exposure;

  @HiveField(3)
  final int hdIndex;

  @HiveField(4)
  final bool isUsed;

  //shouldn't I also have private and public key data here?

  Address({
    required this.address,
    required this.walletPubKey,
    required this.exposure,
    required this.hdIndex,
    required this.isUsed,
  });

  @override
  List<Object?> get props => [
        address,
        walletPubKey,
        exposure,
        hdIndex,
        isUsed,
      ];

  @override
  List<String> get propNames => [
        'address',
        'walletPubKey',
        'exposure',
        'hdIndex',
        'isUsed',
      ];

  @override
  bool? get stringify => true;

  // not right
  // import 'package:moontree_client/moontree_client.dart' as client;
  //factory Address.from(client.Address address) => Address(
  //      address: address.address,
  //      walletPubKey: address.wallet_id,
  //      exposure: address.exposure,
  //      hdIndex: address.hd_index,
  //      isUsed: address.is_used,
  //    );
}
