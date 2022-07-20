import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:utils/mixins/string.dart';

class Wallet with HiveObjectMixin, EquatableMixin, ToStringMixin {
  @HiveField(0)
  final String publicKey;

  @HiveField(1)
  final int? derivationId;

  Wallet({
    required this.publicKey,
    required this.derivationId,
  });

  @override
  List<Object?> get props => [
        publicKey,
        derivationId,
      ];

  @override
  List<String> get propNames => [
        'publicKey',
        'derivationId',
      ];

  @override
  bool? get stringify => true;

  factory Wallet.from(client.Wallet wallet) => Wallet(
        publicKey: wallet.public_key,
        derivationId: wallet.derivation_id,
      );
}
