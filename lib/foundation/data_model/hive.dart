/// this service is to help us initialize hive in multiple steps across mutliple
/// startup pages.

import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:moontree/foundation/data_model/hive_initializer.dart';
import 'package:moontree_utils/moontree_utils.dart' show ReaderWriterLock;

enum HiveLoaded { True, False, Partial }

class DataLoadingHelper {
  final _loadedLock = ReaderWriterLock();
  HiveLoaded _loaded = HiveLoaded.False;
  late HiveInitializer hiveInit;

  DataLoadingHelper() {
    hiveInit = HiveInitializer(init: (dbDir) => Hive.initFlutter());
  }

  Future setupDatabaseStart() async {
    await hiveInit.setUpStart();
  }

  Future setupDatabase() async {
    await hiveInit.setUp(HiveLoadingStep.all);
  }

  Future setupDatabase1() async {
    await hiveInit.setUp(HiveLoadingStep.step1);
  }

  Future setupDatabase2() async {
    await hiveInit.setUp(HiveLoadingStep.step2);
  }

  Future isPartiallyLoaded() async =>
      await _loadedLock.read(() => _loaded == HiveLoaded.Partial);

  Future isLoaded() async =>
      await _loadedLock.read(() => _loaded == HiveLoaded.True);

  //Future setupWaiters() async {
  //  initWaiters(HiveLoadingStep.all);
  //  unawaited(waiters.app.logoutThread());
  //}

  //Future setupWaiters1() async {
  //  initWaiters(HiveLoadingStep.step1);
  //  await _loadedLock.write(() => _loaded = HiveLoaded.Partial);
  //}

  //Future setupWaiters2() async {
  //  initWaiters(HiveLoadingStep.step2);
  //  unawaited(waiters.app.logoutThread());
  //  await _loadedLock.write(() => _loaded = HiveLoaded.True);
  //}
}
