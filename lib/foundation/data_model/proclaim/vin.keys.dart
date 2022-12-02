part of 'vin.dart';

/// byId

class _IdKey extends Key<VinRecord> {
  @override
  String getKey(VinRecord vin) => vin.id;
}

extension ByIdMethodsForVin on Index<_IdKey, VinRecord> {
  VinRecord? getOne(String transactionHash, String? voutTransactionHash,
          int? voutPosition) =>
      getByKeyStr(VinRecord.generateId(
              transactionHash, voutTransactionHash, voutPosition))
          .firstOrNull;
}

/// byVout

class _VoutKey extends Key<VinRecord> {
  @override
  String getKey(VinRecord vin) => vin.voutId;
}

extension ByVoutMethodsForVin on Index<_VoutKey, VinRecord> {
  VinRecord? getOne(
    String voutTransactionHash,
    int voutPosition,
  ) =>
      getByKeyStr(VoutRecord.generateId(voutTransactionHash, voutPosition))
          .firstOrNull;
}

/// byCoinbase

class _CoinbaseKey extends Key<VinRecord> {
  @override
  String getKey(VinRecord vin) => vin.voutId;
}

extension ByCoinbaseMethodsForVin on Index<_CoinbaseKey, VinRecord> {
  Iterable<VinRecord> getAll() => getByKeyStr('null:null');
}

/// txHash

class _TxHashKey extends Key<VinRecord> {
  @override
  String getKey(VinRecord vin) => vin.transactionHash;
}

extension ByTxHashMethodsForVin on IndexMultiple<_TxHashKey, VinRecord> {
  List<VinRecord> getAll(String transactionHash) =>
      getByKeyStr(transactionHash);
}
