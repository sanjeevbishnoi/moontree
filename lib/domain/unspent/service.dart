/// selects a sublist of a given unspents list

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';
import 'package:moontree_layer_flutter/domain/unspent/failure.dart';
import 'package:moontree_layer_flutter/domain/unspent/util.dart' as util;

@Injectable()
class UnspentService {
  const UnspentService();

  /// selects unspents using send.assetUnspents and send.ravenUnspents,
  /// return a list of unspents selected from the given list that at least
  /// match the total. also, choose them at random.
  Future<Either<UnspentFailure, List<Unspent>>> selectUnspents({
    required List<Unspent> unspents,
    required Amount amount,
    required Amount fee,
    bool largestFirst = false,
  }) async =>
      right(largestFirst
          ? _selectUnspentsLargestFirst(
              unspents: unspents,
              total: amount + fee,
            )
          : _selectUnspents(
              unspents: unspents,
              total: amount + fee,
            ));

  List<Unspent> _selectUnspents({
    required List<Unspent> unspents,
    required Amount total,
  }) {
    var gathered = 0;
    var collection = <Unspent>[];
    var tempUnspents = List<Unspent>.from(unspents);
    final _random = util.deterministicRandom(tempUnspents);
    while (total.asSats - gathered > 0 && tempUnspents.isNotEmpty) {
      var randomIndex = _random.nextInt(tempUnspents.length);
      var unspent = tempUnspents[randomIndex];
      tempUnspents.removeAt(randomIndex);
      gathered += unspent.amount.asSats;
      collection.add(unspent);
    }
    return collection;
  }

  List<Unspent> _selectUnspentsLargestFirst({
    required List<Unspent> unspents,
    required Amount total,
  }) {
    var gathered = 0;
    var collection = <Unspent>[];
    var tempUnspents = List<Unspent>.from(unspents);
    tempUnspents.sort(util.largestFrist);
    while (total.asSats - gathered > 0 && tempUnspents.isNotEmpty) {
      var unspent = tempUnspents[0];
      tempUnspents.removeAt(0);
      gathered += unspent.amount.asSats;
      collection.add(unspent);
    }
    return collection;
  }
}
