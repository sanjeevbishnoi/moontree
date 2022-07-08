import 'package:moontree_client/moontree_client.dart' as client;
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

class AssetMetadata with HiveObjectMixin, EquatableMixin {
  @HiveField(0)
  final bool reissuable;

  @HiveField(1)
  final int totalSupply;

  @HiveField(2)
  final int divisibility;

  @HiveField(3)
  final String? associatedData;

  @HiveField(4)
  final String? verifierString;

  @override
  List<Object?> get props => [
        reissuable,
        totalSupply,
        divisibility,
        associatedData,
        verifierString,
      ];

  AssetMetadata({
    required this.reissuable,
    required this.totalSupply,
    required this.divisibility,
    required this.associatedData,
    required this.verifierString,
  });

  factory AssetMetadata.from(client.AssetMetadata assetMetadata) =>
      AssetMetadata(
        reissuable: assetMetadata.reissuable,
        totalSupply: assetMetadata.total_supply,
        divisibility: assetMetadata.divisibility,
        associatedData: assetMetadata.associated_data,
        verifierString: assetMetadata.verifier_string,
      );
}
