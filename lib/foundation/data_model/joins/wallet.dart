import 'package:collection/collection.dart';
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as data;
import 'package:moontree/foundation/data_model/records/records.dart';

extension WRHasManyAddressRecords on WalletRecord {
  Iterable<WalletAddressRecord> get links =>
      data.walletsAddresses.byWallet.getAll(pubkey, derivation);
  Iterable<AddressRecord> get addresses => [
        for (var wal in links) data.addresses.byId.getOne(wal.address)
      ].whereType<AddressRecord>();
  Iterable<String> get rawAddresses => [for (var link in links) link.address];
}

extension WRecordHasOneNextUnusedAddressRecord on WalletRecord {
  AddressRecord? get nextUnusedAddress => addresses
      .where((AddressRecord a) => !a.used)
      .sorted((a, b) => a.index.compareTo(b.index))
      .firstOrNull;
}
