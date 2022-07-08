import 'dart:math';

import 'package:moontree_layer_flutter/domain/unspent/entity.dart';

Random deterministicRandom(List<Unspent> unspents) =>
    Random(unspents.map((e) => e.txId).join().hashCode);

int largestFrist(Unspent a, Unspent b) =>
    b.amount.asSats.compareTo(a.amount.asSats);
