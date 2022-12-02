import 'package:equatable/equatable.dart';
import 'package:moontree_utils/extensions/string.dart';
import 'package:moontree_utils/mixins/string.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/utils/helpers.dart';
import 'package:moontree/foundation/utils/structs.dart';

class DomainAsset with EquatableMixin, ToStringMixin {
  final String symbol;
  final Protocols protocol;
  final AssetType assetType;
  final String name;

  DomainAsset({
    required this.symbol,
    required this.protocol,
    required this.assetType,
    required this.name,
  });

  String get id => generateId(symbol, protocol);
  static String generateId(String symbol, Protocols protocol) =>
      '$symbol:${protocol.name}';

  factory DomainAsset.from(AssetRecord asset, Protocols protocol) =>
      DomainAsset(
        symbol: asset.symbol,
        protocol: protocol,
        assetType: assetTypeOf(asset.symbol),
        name: asset.symbol.toTitleCase(),
      );

  @override
  List<Object?> get props => [
        symbol,
        protocol,
        assetType,
        name,
      ];

  @override
  List<String> get propNames => [
        'symbol',
        'protocol',
        'assetType',
        'name',
      ];

  @override
  bool? get stringify => true;
}
