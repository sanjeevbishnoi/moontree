import 'package:collection/collection.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension WRHasManyAddressDeviceRecords on WalletDeviceRecord {
  Iterable<WalletAddressDeviceRecord> get links =>
      data.walletsAddresses.byWallet.getAll(pubkey, derivation);
  Iterable<AddressDeviceRecord> get addresses => [
        for (var wal in links) data.addresses.byId.getOne(wal.address)
      ].whereType<AddressDeviceRecord>();
  Iterable<String> get rawAddresses => [for (var link in links) link.address];
}

extension WDeviceRecordHasOneNextUnusedAddressDeviceRecord
    on WalletDeviceRecord {
  AddressDeviceRecord? get nextUnusedAddress => addresses
      .where((AddressDeviceRecord a) => !a.used)
      .sorted((a, b) => a.index.compareTo(b.index))
      .firstOrNull;
}
