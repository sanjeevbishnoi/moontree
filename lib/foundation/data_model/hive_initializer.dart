/// it occurs to me that by using Hive we may be running into a problem we also
/// had in V1. Loading the database was slow. we were able to mitigate it but
/// since we're building this from scratch again, do we perhaps want to use a
/// raw sqlite database? we'd still have to load that into memory just manually.
///
/// I think the correct action is to use Hive still, mitigate it as we did in V1
/// and if that turns out to be not good enough, we can look at other options.
/// For instance we may decide to never save transaction data, and download it
/// anew each time to go to a holding.
///
/// At this point we don't know if any other option would be better, so we'll
/// make that decision later.

import 'dart:io';
import 'package:hive/hive.dart';
import 'package:proclaim/proclaim.dart' show HiveSource;
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

/// all: loads all the tables
/// step1: loads the tables necessary to display home screen
/// step2: loads the tables necessary to display all other screens
enum HiveLoadingStep { all, step1, step2 }

class HiveInitializer {
  late final String id;
  late Function init;
  late Function beforeLoad;
  bool destroyOnTeardown;

  String get dbDir => 'database-$id';

  HiveInitializer({
    String? id,
    Function? init,
    Function? beforeLoad,
    this.destroyOnTeardown = false,
  }) {
    this.id = id ?? 'database';
    this.init = init ?? (dbDir) => Hive.init(dbDir);
    this.beforeLoad = beforeLoad ?? () {};
  }
  Future setUpStart() async {
    registerAdapters();
    await init(dbDir);
  }

  Future setUp(HiveLoadingStep step) async {
    await openBoxes(step);
    if ([HiveLoadingStep.all, HiveLoadingStep.step1].contains(step)) {
      beforeLoad();
    }
    load(step);
  }

  Future tearDown() async {
    await Hive.close();
    if (destroyOnTeardown) {
      await destroy();
    }
  }

  /// fast so we just do them all at once
  void registerAdapters() {
    Hive.registerAdapter(AddressBalanceDeviceRecordAdapter());
    Hive.registerAdapter(AddressDeviceRecordAdapter());
    Hive.registerAdapter(AssetDeviceRecordAdapter());
    Hive.registerAdapter(TransactionDeviceRecordAdapter());
    Hive.registerAdapter(VinDeviceRecordAdapter());
    Hive.registerAdapter(VoutDeviceRecordAdapter());
    Hive.registerAdapter(WalletAddressDeviceRecordAdapter());
    Hive.registerAdapter(WalletBalanceDeviceRecordAdapter());
    Hive.registerAdapter(WalletDeviceRecordAdapter());
  }

  Future openBoxes(HiveLoadingStep step) async {
    if ([HiveLoadingStep.all, HiveLoadingStep.step1].contains(step)) {
      await Hive.openBox<AssetDeviceRecord>('assets');
      await Hive.openBox<WalletBalanceDeviceRecord>('walletBalances');
      await Hive.openBox<WalletDeviceRecord>('wallets');
    }
    if ([HiveLoadingStep.all, HiveLoadingStep.step2].contains(step)) {
      await Hive.openBox<AddressBalanceDeviceRecord>('addressBalances');
      await Hive.openBox<AddressDeviceRecord>('addresses');
      await Hive.openBox<WalletAddressDeviceRecord>('walletAddresses');
      await Hive.openBox<TransactionDeviceRecord>('transactions');
      await Hive.openBox<VinDeviceRecord>('vins');
      await Hive.openBox<VoutDeviceRecord>('vouts');
    }
  }

  void load(HiveLoadingStep step) {
    if ([HiveLoadingStep.all, HiveLoadingStep.step1].contains(step)) {
      cache.assets.setSource(HiveSource('assets'));
      cache.walletBalances.setSource(HiveSource('walletBalances'));
      cache.wallets.setSource(HiveSource('wallets'));
    }
    if ([HiveLoadingStep.all, HiveLoadingStep.step2].contains(step)) {
      cache.addressBalances.setSource(HiveSource('addressBalances'));
      cache.addresses.setSource(HiveSource('addresses'));
      cache.walletAddresses.setSource(HiveSource('walletAddresses'));
      cache.transactions.setSource(HiveSource('transactions'));
      cache.vins.setSource(HiveSource('vins'));
      cache.vouts.setSource(HiveSource('vouts'));
    }
  }

  Future destroy() async {
    var dir = Directory(dbDir);
    if (await dir.exists()) {
      await dir.delete(recursive: true);
    }
  }
}
