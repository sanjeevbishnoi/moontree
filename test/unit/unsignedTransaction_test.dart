// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/send/entity.dart';
import 'package:moontree_layer_flutter/domain/send/irepository.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/entity.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/service_test.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';
import 'package:moontree_layer_flutter/domain/unspent/failure.dart';
import 'package:moontree_layer_flutter/domain/unspent/irepository.dart';
import 'package:moontree_layer_flutter/domain/unspent/service.dart';
import 'package:moontree_layer_flutter/injection.dart';

void main() async {
  configureInjection(Env.test);
  IUnspentRepository unspentRepository = getIt<IUnspentRepository>();
  UnspentService unspentService = getIt<UnspentService>();
  Either<UnspentFailure, List<Unspent>> unspents =
      await unspentRepository.getUnspents();

  ISendRepository sendRepository = getIt<ISendRepository>();
  UnsignedTransactionService unsignedTransactionService =
      getIt<UnsignedTransactionService>();

  setUp(() async {
    //configureInjection(Env.test);
  });
  test('create', () async {
    expect(
      (await unsignedTransactionService.create(
        selectedUnspents: (await unspentService.selectUnspents(
          unspents: unspents.getOrElse(() => []),
          amount: Amount(10),
          fee: Amount(0),
          largestFirst: false,
        ))
            .getOrElse(() => []),
        send: (await sendRepository.getSend()).getOrElse(() => Send.empty()),
      ))
          .getOrElse(() => UnsignedTransaction.empty())
          .fee,
      Amount(0.4356),
    );
  });
}
