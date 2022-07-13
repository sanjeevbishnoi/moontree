import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:utils/mixins/string.dart';

class Asset with HiveObjectMixin, EquatableMixin, ToStringMixin {
  @HiveField(0)
  final String symbol;

  @HiveField(1)
  final bool reissuable;

  @HiveField(2)
  final int totalSupply;

  @HiveField(3)
  final int divisibility;

  @HiveField(4)
  final String? associatedData;

  @HiveField(5)
  final String? verifierString;

  @HiveField(5)
  final String? assetName;

  Asset({
    required this.symbol,
    required this.reissuable,
    required this.totalSupply,
    required this.divisibility,
    this.associatedData,
    this.verifierString,
    this.assetName,
  });

  @override
  List<Object?> get props => [
        symbol,
        reissuable,
        totalSupply,
        divisibility,
        associatedData,
        verifierString,
        assetName,
      ];

  @override
  List<String> get propNames => [
        'symbol',
        'reissuable',
        'totalSupply',
        'divisibility',
        'associatedData',
        'verifierString',
        'assetName',
      ];

  @override
  bool? get stringify => true;

  /// not right
  //import 'package:moontree_client/moontree_client.dart' as client;
  //factory Asset.from(client.Asset asset) => Asset(
  //      symbol: asset.symbol,
  //      reissuable: assetMetadata.reissuable,
  //      totalSupply: assetMetadata.total_supply,
  //      divisibility: assetMetadata.divisibility,
  //      associatedData: assetMetadata.associated_data,
  //      verifierString: assetMetadata.verifier_string,
  //    );
}
