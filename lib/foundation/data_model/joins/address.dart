import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension ARHasManyWalletRecords on AddressRecord {
  Iterable<WalletAddressRecord> get links =>
      data.walletsAddresses.byAddress.getAll(address);
  Iterable<WalletRecord> get wallets => [
        for (var wal in links)
          data.wallets.byId.getOne(wal.pubkey, wal.derivation)
      ].whereType<WalletRecord>();
}

extension ARHasManyVoutRecords on AddressRecord {
  Iterable<VoutRecord> get vouts => data.vouts.byAddress.getAll(address);
}

extension ARHasManyABRecords on AddressRecord {
  Iterable<AddressBalanceRecord> get balances =>
      data.addressBalances.byAddress.getAll(address);
}
