import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:quiver/iterables.dart';
import 'package:tuple/tuple.dart';

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

extension EnumeratedIteratable on Iterable {
  Iterable<List> enumerated() =>
      zip([mapIndexed((index, element) => index).toList(), this]);

  Iterable<Tuple2<int, T>> enumeratedTuple<T>() => [
        for (var x
            in zip([mapIndexed((index, element) => index).toList(), this]))
          Tuple2(x[0] as int, x[1] as T)
      ];
}
