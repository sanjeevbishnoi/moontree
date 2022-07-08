import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Wallet with HiveObjectMixin, EquatableMixin {
  @HiveField(0)
  final String masterPublicKey;

  @HiveField(1)
  final String derivationPath;

  @HiveField(2)
  final int highestUsedReceiveIndex;

  @HiveField(3)
  final int highestUsedChangeIndex;

  @override
  List<Object?> get props => [
        masterPublicKey,
        derivationPath,
        highestUsedReceiveIndex,
        highestUsedChangeIndex,
      ];

  Wallet({
    required this.masterPublicKey,
    required this.derivationPath,
    required this.highestUsedReceiveIndex,
    required this.highestUsedChangeIndex,
  });

  factory Wallet.from(client.Wallet wallet) => Wallet(
        masterPublicKey: wallet.master_public_key,
        derivationPath: wallet.derivation_path,
        highestUsedReceiveIndex: wallet.highest_used_receive_index,
        highestUsedChangeIndex: wallet.highest_used_change_index,
      );
}
