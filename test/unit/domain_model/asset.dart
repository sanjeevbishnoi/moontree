// ignore_for_file: avoid_print

//import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'package:moontree/foundation/utils/structs.dart';
import 'package:moontree/foundation/utils/helpers.dart';
import 'package:moontree/foundation/triggers/asset.dart' show ToAssetDomain;
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;

import '../../fixtures/domain_model/fixtures.dart';

void main() {
  group('asset', () {
    setUp(() {});
    test('get correct type', () async {
      expect(assetTypeOf('ASSET'), AssetType.main);
      expect(assetTypeOf('ASSET/ASSET'), AssetType.main);
      expect(assetTypeOf('ASSET!'), AssetType.admin);
      expect(assetTypeOf('#ASSET'), AssetType.qualifier);
      expect(assetTypeOf('\$ASSET'), AssetType.restricted);
      expect(assetTypeOf('ASSET/#ASSET'), AssetType.nft);
      expect(assetTypeOf('ASSET/~ASSET'), AssetType.channel);
      expect(assetTypeOf('RVN'), AssetType.currency);
      expect(assetTypeOf('RAVENCOIN'), AssetType.currency);
      expect(assetTypeOf('_ASSET'), AssetType.unknown);
      expect(assetTypeOf('ASSET WITH SPACES'), AssetType.unknown);
      expect(assetTypeOf('ASSETHASTOOMANYCHARACTERSINITTOBEVALID'),
          AssetType.unknown);
    });
    test('data_model asset to domain_model asset', () async {
      useFixture();
      final asset = AssetDeviceRecord(
        symbol: 'MOONTREE',
        reissuable: false,
        supply: 1000,
        divisibility: 4,
      );
      final call = () =>
          domain.assets.byId.getOne(asset.symbol, Protocols.ravencoinMainnet);
      expect(call(), isNull);
      await ToAssetDomain.load(asset);
      expect(call(), isNotNull);
      expect(call()!.assetType, AssetType.main);
      expect(call()!.name, 'Moontree');
    });
  });
}
