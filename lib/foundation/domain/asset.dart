import 'package:moontree_layer_client/moontree_layer_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class Asset with HiveObjectMixin, EquatableMixin {
  @HiveField(0)
  final String symbol;

  @HiveField(1)
  final int latestMetadataId;

  @override
  List<Object?> get props => [
        symbol,
        latestMetadataId,
      ];

  Asset({
    required this.symbol,
    required this.latestMetadataId,
  });

  factory Asset.from(client.Asset asset) => Asset(
        symbol: asset.symbol,
        latestMetadataId: asset.latest_metadata_id,
      );
}
