import 'package:equatable/equatable.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:utils/mixins/string.dart';

class DomainAsset with EquatableMixin, ToStringMixin {
  final FullName fullName;
  final AssetType assetType;
  final Name name;

  DomainAsset({
    required this.fullName,
    required this.assetType,
    required this.name,
  });

  @override
  List<Object?> get props => [
        fullName,
        assetType,
        name,
      ];

  @override
  List<String> get propNames => [
        'fullName',
        'assetType',
        'name',
      ];

  @override
  bool? get stringify => true;

  factory DomainAsset.from(dynamic x) => DomainAsset(
        fullName: x.fullName,
        assetType: x.assetType,
        name: x.name,
      );

  String get id => getId(fullName, assetType);

  static String getId(FullName fullName, AssetType assetType) =>
      '${fullName.getOrCrash()}:${assetType.name}';
}
