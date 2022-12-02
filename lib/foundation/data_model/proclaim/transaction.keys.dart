part of 'transaction.dart';

/// hash - primary key

class _HashKey extends Key<TransactionRecord> {
  @override
  String getKey(TransactionRecord transaction) => transaction.hash;
}

extension ByHashMethodsForTransaction
    on IndexMultiple<_HashKey, TransactionRecord> {
  TransactionRecord? getOne(String hash) => getByKeyStr(hash).firstOrNull;
}

/// height

class _HeightKey extends Key<TransactionRecord> {
  @override
  String getKey(TransactionRecord transaction) => transaction.height.toString();
}

extension ByHeightMethodsForTransaction
    on IndexMultiple<_HeightKey, TransactionRecord> {
  TransactionRecord? getOne(int height) =>
      getByKeyStr(height.toString()).firstOrNull;
}
