import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension ARHasManyWalletDeviceRecords on AddressDeviceRecord {
  Iterable<WalletAddressDeviceRecord> get links =>
      data.walletAddresses.byAddress.getAll(address);
  Iterable<WalletDeviceRecord> get wallets => [
        for (var wal in links)
          data.wallets.byId.getOne(wal.pubkey, wal.derivation)
      ].whereType<WalletDeviceRecord>();
}

extension ARHasManyVoutDeviceRecords on AddressDeviceRecord {
  Iterable<VoutDeviceRecord> get vouts => data.vouts.byAddress.getAll(address);
}

extension ARHasManyABDeviceRecords on AddressDeviceRecord {
  Iterable<AddressBalanceDeviceRecord> get balances =>
      data.addressBalances.byAddress.getAll(address);
}
