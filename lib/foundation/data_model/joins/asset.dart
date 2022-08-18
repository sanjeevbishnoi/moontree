import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension AssetRHasManyVoutDeviceRecords on AssetDeviceRecord {
  List<VoutDeviceRecord> get vouts => data.vouts.bySymbol.getAll(symbol);
}
