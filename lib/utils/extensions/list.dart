import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/unspent/entity.dart';

/// unused
//extension AdditionOnUnspent on Unspent {
//  Unspent operator +(Unspent other) => Unspent(
//        txId: txId,
//        position: position,
//        toAddress: toAddress,
//        amount: amount + other.amount,
//        lockingScript: lockingScript,
//      );
//}

extension SumAnUnspentList on List<Unspent> {
  Amount sum() => isEmpty
      ? Amount(0)
      : fold(
          Amount(0),
          (Amount previousValue, Unspent element) =>
              previousValue + element.amount);
}
