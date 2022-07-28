part of 'transaction.dart';

/// hash - primary key

class _HashKey extends Key<TransactionDeviceRecord> {
  @override
  String getKey(TransactionDeviceRecord transaction) => transaction.hash;
}

extension ByHashMethodsForTransaction
    on IndexMultiple<_HashKey, TransactionDeviceRecord> {
  TransactionDeviceRecord? getOne(String hash) => getByKeyStr(hash).firstOrNull;
}

/// height

class _HeightKey extends Key<TransactionDeviceRecord> {
  @override
  String getKey(TransactionDeviceRecord transaction) =>
      transaction.height.toString();
}

extension ByHeightMethodsForTransaction
    on IndexMultiple<_HeightKey, TransactionDeviceRecord> {
  TransactionDeviceRecord? getOne(int height) =>
      getByKeyStr(height.toString()).firstOrNull;
}
