part of 'vout.dart';

/// txvout - primary key

class _TxVoutKey extends Key<VoutDeviceRecord> {
  @override
  String getKey(VoutDeviceRecord vout) => vout.id;
}

extension ByTxVoutMethodsForVout
    on IndexMultiple<_TxVoutKey, VoutDeviceRecord> {
  VoutDeviceRecord? getOne(String transaction, int position) =>
      getByKeyStr(VoutDeviceRecord.generateId(transaction, position))
          .firstOrNull;
}

/// bySymbol

class _SymbolKey extends Key<VoutDeviceRecord> {
  @override
  String getKey(VoutDeviceRecord vout) => vout.symbol;
}

extension BySymbolMethodsForVout
    on IndexMultiple<_SymbolKey, VoutDeviceRecord> {
  List<VoutDeviceRecord> getAll(String symbol) => getByKeyStr(symbol);
}

/// address

class _AddressKey extends Key<VoutDeviceRecord> {
  @override
  String getKey(VoutDeviceRecord vout) => vout.address;
}

extension ByAddressMethodsForVout
    on IndexMultiple<_AddressKey, VoutDeviceRecord> {
  List<VoutDeviceRecord> getAll(String? address) =>
      address == null ? <VoutDeviceRecord>[] : getByKeyStr(address);
}

/// txhash

class _TxHashKey extends Key<VoutDeviceRecord> {
  @override
  String getKey(VoutDeviceRecord vout) => vout.transactionHash;
}

extension ByTxHashMethodsForVout
    on IndexMultiple<_TxHashKey, VoutDeviceRecord> {
  List<VoutDeviceRecord> getAll(String transactionHash) =>
      getByKeyStr(transactionHash);
}
