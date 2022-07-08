// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';
import 'package:moontree_layer_flutter/domain/unspent/failure.dart';
import 'package:moontree_layer_flutter/domain/unspent/irepository.dart';
import 'package:moontree_layer_flutter/domain/unspent/service.dart';
import 'package:moontree_layer_flutter/injection.dart';
import 'package:moontree_layer_flutter/utils/extensions/list.dart';

void main() async {
  configureInjection(Env.test);
  IUnspentRepository unspentRepository = getIt<IUnspentRepository>();
  UnspentService unspentService = getIt<UnspentService>();
  Either<UnspentFailure, List<Unspent>> unspents =
      await unspentRepository.getUnspents();
  setUp(() async {
    //configureInjection(Env.test);
  });
  test('get empty list for 0 amount', () async {
    expect(
      (await unspentService.selectUnspents(
        unspents: unspents.getOrElse(() => []),
        amount: Amount(0),
        fee: Amount(0),
        largestFirst: false,
      ))
          .getOrElse(() => []),
      [],
    );
  });
  test('get enough unspents for various amounts and fees', () async {
    expect(
      (await unspentService.selectUnspents(
            unspents: unspents.getOrElse(() => []),
            amount: Amount(.1),
            fee: Amount(0),
            largestFirst: false,
          ))
              .getOrElse(() => [])
              .sum() >=
          Amount(.1),
      true,
    );
    expect(
      (await unspentService.selectUnspents(
            unspents: unspents.getOrElse(() => []),
            amount: Amount(.01),
            fee: Amount(.09),
            largestFirst: false,
          ))
              .getOrElse(() => [])
              .sum() >=
          Amount(.09) + Amount(.01),
      true,
    );
    expect(
      (await unspentService.selectUnspents(
            unspents: unspents.getOrElse(() => []),
            amount: Amount(.1),
            fee: Amount(.9),
            largestFirst: false,
          ))
              .getOrElse(() => [])
              .sum() >=
          Amount(.9) + Amount(.1),
      true,
    );
    expect(
      (await unspentService.selectUnspents(
            unspents: unspents.getOrElse(() => []),
            amount: Amount(1),
            fee: Amount(.1),
            largestFirst: false,
          ))
              .getOrElse(() => [])
              .sum() >=
          Amount(1) + Amount(.1),
      true,
    );
    expect(
      (await unspentService.selectUnspents(
            unspents: unspents.getOrElse(() => []),
            amount: Amount(9),
            fee: Amount(.1),
            largestFirst: false,
          ))
              .getOrElse(() => [])
              .sum() >=
          Amount(9) + Amount(.1),
      true,
    );
    expect(
      (await unspentService.selectUnspents(
            unspents: unspents.getOrElse(() => []),
            amount: Amount(9.9),
            fee: Amount(.1),
            largestFirst: false,
          ))
              .getOrElse(() => [])
              .sum() >=
          Amount(9.9) + Amount(.1),
      true,
    );
  });
  test('get largest first', () async {
    expect(
        (await unspentService.selectUnspents(
          unspents: unspents.getOrElse(() => []),
          amount: Amount(1),
          fee: Amount(.1),
          largestFirst: true,
        ))
            .getOrElse(() => []),
        [unspents.getOrElse(() => []).last]);
  });
  test('get all by largest first', () async {
    expect(
      (await unspentService.selectUnspents(
        unspents: unspents.getOrElse(() => []),
        amount: Amount(111),
        fee: Amount(.01),
        largestFirst: true,
      ))
          .getOrElse(() => [])
          .toSet(),
      unspents.getOrElse(() => []).toSet(),
    );
  });
  test('get all unspents even if it is not enough', () async {
    expect(
      (await unspentService.selectUnspents(
        unspents: unspents.getOrElse(() => []),
        amount: Amount(200),
        fee: Amount(1),
        largestFirst: false,
      ))
          .getOrElse(() => [])
          .toSet(),
      unspents.getOrElse(() => []).toSet(),
    );
  });
}
