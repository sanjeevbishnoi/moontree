/// initialize hive for this cache
import 'package:moontree/foundation/data_model/hive.dart';
export 'package:moontree/foundation/data_model/proclaim/proclaim.dart';

/// can be called from or moved to anywhere - like spash screen:
class DataModel {
  static final DataLoadingHelper HIVE_INIT = DataLoadingHelper();

  static Future<void> init() async {
    await DataModel.HIVE_INIT.setupDatabaseStart();
    await DataModel.HIVE_INIT.setupDatabase();
  }
}
