import 'package:moontree_layer_client/moontree_layer_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Vin with HiveObjectMixin, EquatableMixin {
  @HiveField(0)
  final int transactionId;

  @HiveField(1)
  final int? voutId;

  @override
  List<Object?> get props => [
        transactionId,
        voutId,
      ];

  Vin({
    required this.transactionId,
    required this.voutId,
  });

  factory Vin.from(client.Vin vin) => Vin(
        transactionId: vin.transaction_id,
        voutId: vin.vout_id,
      );
}
