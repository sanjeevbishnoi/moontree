import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:utils/mixins/string.dart';

class Vin with HiveObjectMixin, EquatableMixin, ToStringMixin {
  @HiveField(0)
  final int transactionId;

  @HiveField(1)
  final int? voutId;

  Vin({
    required this.transactionId,
    required this.voutId,
  });

  @override
  List<Object?> get props => [
        transactionId,
        voutId,
      ];

  @override
  List<String> get propNames => [
        'transactionId',
        'voutId',
      ];

  @override
  bool? get stringify => true;

  factory Vin.from(client.Vin vin) => Vin(
        transactionId: vin.transaction_id,
        voutId: vin.vout_id,
      );
}
