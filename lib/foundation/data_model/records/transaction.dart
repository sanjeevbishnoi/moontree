import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:utils/mixins/string.dart';

class RavenTransaction with HiveObjectMixin, EquatableMixin, ToStringMixin {
  @HiveField(0)
  final String hash;

  @HiveField(1)
  final int height;

  @HiveField(2)
  final String? opReturn;

  RavenTransaction({
    required this.hash,
    required this.height,
    this.opReturn,
  });

  @override
  List<Object?> get props => [
        hash,
        height,
        opReturn,
      ];

  @override
  List<String> get propNames => [
        'hash',
        'height',
        'opReturn',
      ];

  @override
  bool? get stringify => true;

  factory RavenTransaction.from(client.RavenTransaction ravenTransaction) =>
      RavenTransaction(
        hash: ravenTransaction.hash,
        height: ravenTransaction.height,
        opReturn: ravenTransaction.op_return,
      );
}
