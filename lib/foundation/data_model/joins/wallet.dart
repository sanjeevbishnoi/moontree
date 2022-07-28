import 'package:collection/collection.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

extension WRHasManyAddressDeviceRecords on WalletDeviceRecord {
  Iterable<WalletAddressDeviceRecord> get links =>
      cache.walletAddresses.byWallet.getAll(pubkey, derivation);
  Iterable<AddressDeviceRecord> get addresses => [
        for (var wal in links) cache.addresses.byId.getOne(wal.address)
      ].whereType<AddressDeviceRecord>();
}

extension WDeviceRecordHasOneNextUnusedAddressDeviceRecord
    on WalletDeviceRecord {
  AddressDeviceRecord get nextUnusedAddress => addresses
      .where((AddressDeviceRecord a) => !a.used)
      .sorted((a, b) => a.index.compareTo(b.index))
      .first;
}
