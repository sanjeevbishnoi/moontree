import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class RavenTransaction with HiveObjectMixin, EquatableMixin {
  @HiveField(0)
  final String hash;

  @HiveField(1)
  final int height;

  @HiveField(2)
  final DateTime blocktime;

  @HiveField(3)
  final String? opReturn;

  @override
  List<Object?> get props => [
        hash,
        height,
        blocktime,
        opReturn,
      ];

  RavenTransaction({
    required this.hash,
    required this.height,
    required this.blocktime,
    required this.opReturn,
  });

  factory RavenTransaction.from(client.RavenTransaction ravenTransaction) =>
      RavenTransaction(
        hash: ravenTransaction.hash,
        height: ravenTransaction.height,
        blocktime: ravenTransaction.blocktime,
        opReturn: ravenTransaction.op_return,
      );
}
