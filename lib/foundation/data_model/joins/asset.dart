import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

extension AssetRHasManyVoutDeviceRecords on AssetDeviceRecord {
  List<VoutDeviceRecord> get vouts => cache.vouts.bySymbol.getAll(symbol);
}
