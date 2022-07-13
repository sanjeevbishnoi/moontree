import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:moontree/utils/string.dart';

class RavenTransaction with HiveObjectMixin, EquatableMixin, ToStringMixin {
  @HiveField(0)
  final String hash;

  @HiveField(1)
  final int height;

  @HiveField(2)
  final DateTime blocktime;

  @HiveField(3)
  final String? opReturn;

  RavenTransaction({
    required this.hash,
    required this.height,
    required this.blocktime,
    this.opReturn,
  });

  @override
  List<Object?> get props => [
        hash,
        height,
        blocktime,
        opReturn,
      ];

  @override
  List<String> get propNames => [
        'hash',
        'height',
        'blocktime',
        'opReturn',
      ];

  @override
  bool? get stringify => true;

  factory RavenTransaction.from(client.RavenTransaction ravenTransaction) =>
      RavenTransaction(
        hash: ravenTransaction.hash,
        height: ravenTransaction.height,
        blocktime: ravenTransaction.blocktime,
        opReturn: ravenTransaction.op_return,
      );
}
