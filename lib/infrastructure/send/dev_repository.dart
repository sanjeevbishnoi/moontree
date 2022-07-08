// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/send/values.dart';
import 'package:moontree_layer_flutter/domain/send/entity.dart';
import 'package:moontree_layer_flutter/domain/send/failure.dart';
import 'package:moontree_layer_flutter/domain/send/irepository.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';
import 'package:moontree_layer_flutter/infrastructure/holding/dev_repository.dart';
import 'package:moontree_layer_flutter/infrastructure/unspent/dev_repository.dart';
import 'package:moontree_layer_flutter/utils/dev.dart';

@Environment('dev')
@Injectable(as: ISendRepository)
class SendRepository implements ISendRepository {
  const SendRepository();

  @override
  Future<Either<SendFailure, Send>> getSend() async {
    await simulateWait('SendRepository');
    return right(Send(
      holding: Holding.empty(),
      amount: Amount.empty(),
      address: PubKeyAddress.empty(),
      change: PubKeyAddress.empty(),
      feeSelection: FeeSelection.standard,
      memo: Memo.empty(),
      note: Note.empty(),
      sendAll: false,
      assetUnspents: <Unspent>[],
      ravenUnspents: <Unspent>[],
    ));
  }

  @override
  Future<Either<SendFailure, PubKeyAddress>> getChangeAddress() async {
    return right(
        PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g', mainnet: false));
  }

  Future<Either<SendFailure, Send>> getSendExample() async {
    await simulateWait('SendRepository');
    final holding = await HoldingRepository().getHolding().then((value) =>
        value.fold(
            (l) => throw Exception('dev send repository unable to get holding'),
            (r) => r));
    return right(Send(
      holding: holding,
      amount: Amount(100),
      sendAll: false,
      address:
          PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g', mainnet: false),
      change:
          PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g', mainnet: false),
      feeSelection: FeeSelection.standard,
      memo: Memo('memo string'),
      note: Note('memo is not ipfs'),
      assetUnspents: await UnspentRepository()
          .getUnspents(holding)
          .then((value) => value.fold((l) => [], (r) => r)),
      ravenUnspents: await UnspentRepository()
          .getUnspents()
          .then((value) => value.fold((l) => [], (r) => r)),
    ));
  }
}
