/// initialize hive for this cache
import 'package:moontree/foundation/data_model/hive.dart';

final DataLoadingHelper HIVE_INIT = DataLoadingHelper();

/// can be called from or moved to anywhere - like spash screen:
class DataModel {
  static Future<void> init() async {
    await HIVE_INIT.setupDatabaseStart();
    await HIVE_INIT.setupDatabase();
  }
}
