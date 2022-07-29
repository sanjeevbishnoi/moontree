import 'package:equatable/equatable.dart';
import 'package:utils/mixins/string.dart';
import 'package:moontree/foundation/utils/structs.dart';

class DomainAsset with EquatableMixin, ToStringMixin {
  final String symbol;
  final Protocol protocol;
  final AssetType assetType;
  final String name;

  DomainAsset({
    required this.symbol,
    required this.protocol,
    required this.assetType,
    required this.name,
  });

  String get id => generateId(symbol, protocol);
  static String generateId(String symbol, Protocol protocol) =>
      '$symbol:${protocol.name}';

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
