import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:utils/mixins/string.dart';

class Wallet with HiveObjectMixin, EquatableMixin, ToStringMixin {
  @HiveField(0)
  final String masterPublicKey;

  @HiveField(1)
  final List<int> derivationIds;

  Wallet({
    required this.masterPublicKey,
    required this.derivationIds,
  });

  @override
  List<Object?> get props => [
        masterPublicKey,
        derivationIds,
      ];

  @override
  List<String> get propNames => [
        'masterPublicKey',
        'derivationIds',
      ];

  @override
  bool? get stringify => true;

  factory Wallet.from(client.Wallet wallet) => Wallet(
        masterPublicKey: wallet.master_public_key,
        derivationIds: wallet.derivation_ids,
      );
}
