part of 'vin.dart';

/// byId

class _IdKey extends Key<VinDeviceRecord> {
  @override
  String getKey(VinDeviceRecord vin) => vin.id;
}

extension ByIdMethodsForVin on Index<_IdKey, VinDeviceRecord> {
  VinDeviceRecord? getOne(String transactionHash, String? voutTransactionHash,
          int? voutPosition) =>
      getByKeyStr(VinDeviceRecord.generateId(
              transactionHash, voutTransactionHash, voutPosition))
          .firstOrNull;
}

/// byVout

class _VoutKey extends Key<VinDeviceRecord> {
  @override
  String getKey(VinDeviceRecord vin) => vin.voutId.toString();
}

extension ByVoutMethodsForVin on Index<_VoutKey, VinDeviceRecord> {
  VinDeviceRecord? getOne(
    String voutTransactionHash,
    int voutPosition,
  ) =>
      getByKeyStr(
              VinDeviceRecord.generateVoutId(voutTransactionHash, voutPosition))
          .firstOrNull;
}

/// byCoinbase

class _CoinbaseKey extends Key<VinDeviceRecord> {
  @override
  String getKey(VinDeviceRecord vin) => vin.voutId.toString();
}

extension ByCoinbaseMethodsForVin on Index<_CoinbaseKey, VinDeviceRecord> {
  Iterable<VinDeviceRecord> getAll() =>
      getByKeyStr(VinDeviceRecord.generateVoutId(null, null));
}

/// txHash

class _TxHashKey extends Key<VinDeviceRecord> {
  @override
  String getKey(VinDeviceRecord vin) => vin.transactionHash;
}

extension ByTxHashMethodsForVin on IndexMultiple<_TxHashKey, VinDeviceRecord> {
  List<VinDeviceRecord> getAll(String transactionHash) =>
      getByKeyStr(transactionHash);
}
