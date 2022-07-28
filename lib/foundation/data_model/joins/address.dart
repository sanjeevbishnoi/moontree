import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as cache;
import 'package:moontree/foundation/data_model/records/records.dart';

extension ARHasManyWalletDeviceRecords on AddressDeviceRecord {
  Iterable<WalletAddressDeviceRecord> get links =>
      cache.walletAddresses.byAddress.getAll(address);
  Iterable<WalletDeviceRecord> get wallets => [
        for (var wal in links)
          cache.wallets.byId.getOne(wal.pubkey, wal.derivation)
      ].whereType<WalletDeviceRecord>();
}

extension ARHasManyVoutDeviceRecords on AddressDeviceRecord {
  Iterable<VoutDeviceRecord> get vouts => cache.vouts.byAddress.getAll(address);
}
