import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/utils/validation.dart';

/// the problem with validating decimals on Amounts, so we should not.
//  } if (amount amount.floor() < 0 || decimal > 8) {
//    return left(ValueFailure.invalidAmount(amount: amount));
// var b = 123.3210;
// print(b);                                 // 123.321
// print(b.floor());                         // 123
// print(b - b.floor());                     // 0.32099999999999795
// print((b - b.floor()).toString().length); // 19
Either<ValueFailure<double>, double> validateAmount(double amount) {
  if (amount < 0 || amount > 21000000000) {
    return left(ValueFailure.invalidAmount(amount));
  } else {
    return right(amount);
  }
}

Either<ValueFailure<String>, String> validateNote(String note) {
  if (note.length > 10000) {
    return left(ValueFailure.invalidNote(note));
  } else {
    return right(note);
  }
}

Either<ValueFailure<String>, String> validateMemo(String memo) {
  if (memo.isNotEmpty && !isMemo(memo)) {
    return left(ValueFailure.invalidMemo(memo));
  } else {
    return right(memo);
  }
}

Either<ValueFailure<String>, String> validateTxId(String txId) {
  if (!isTxIdRVN(txId)) {
    return left(ValueFailure.invalidTxId(txId));
  } else {
    return right(txId);
  }
}

Either<ValueFailure<int>, int> validateTxPosition(int txPosition) {
  if (txPosition < 0 || txPosition > 10000) {
    return left(ValueFailure.invalidTxPosition(txPosition));
  } else {
    return right(txPosition);
  }
}

/// how do we know if we should validate as mainnet or testnet?....
Either<ValueFailure<String>, String> validatePubKeyAddress(
  String key, {
  bool mainnet = true,
}) {
  if (!isPublicKeyAddress(key, mainnet: mainnet)) {
    return left(ValueFailure.invalidPubKeyAddress(key));
  } else {
    return right(key);
  }
}
