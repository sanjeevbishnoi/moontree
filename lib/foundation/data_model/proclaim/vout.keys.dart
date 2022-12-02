part of 'vout.dart';

/// txvout - primary key

class _TxVoutKey extends Key<VoutRecord> {
  @override
  String getKey(VoutRecord vout) => vout.id;
}

extension ByTxVoutMethodsForVout on IndexMultiple<_TxVoutKey, VoutRecord> {
  VoutRecord? getOne(String transaction, int position) =>
      getByKeyStr(VoutRecord.generateId(transaction, position)).firstOrNull;
}

/// bySymbol

class _SymbolKey extends Key<VoutRecord> {
  @override
  String getKey(VoutRecord vout) => vout.symbol;
}

extension BySymbolMethodsForVout on IndexMultiple<_SymbolKey, VoutRecord> {
  List<VoutRecord> getAll(String symbol) => getByKeyStr(symbol);
}

/// address

class _AddressKey extends Key<VoutRecord> {
  @override
  String getKey(VoutRecord vout) => vout.address;
}

extension ByAddressMethodsForVout on IndexMultiple<_AddressKey, VoutRecord> {
  List<VoutRecord> getAll(String? address) =>
      address == null ? <VoutRecord>[] : getByKeyStr(address);
}

/// txhash

class _TxHashKey extends Key<VoutRecord> {
  @override
  String getKey(VoutRecord vout) => vout.transactionHash;
}

extension ByTxHashMethodsForVout on IndexMultiple<_TxHashKey, VoutRecord> {
  List<VoutRecord> getAll(String transactionHash) =>
      getByKeyStr(transactionHash);
}
