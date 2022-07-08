// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree/domain/send/values.dart';
import 'package:moontree/domain/send/entity.dart';
import 'package:moontree/domain/send/failure.dart';
import 'package:moontree/domain/send/irepository.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/infrastructure/holding/test_repository.dart';
import 'package:moontree/infrastructure/unspent/test_repository.dart';

@Environment('test')
@Injectable(as: ISendRepository)
class SendRepository implements ISendRepository {
  const SendRepository();

  @override
  Future<Either<SendFailure, Send>> getSend() async {
    HoldingRepository _holdingRepository = HoldingRepository();
    UnspentRepository _unspentRepository = UnspentRepository();
    final holding = await _holdingRepository.getHolding().then((value) =>
        value.fold(
            (l) => throw Exception('dev send repository unable to get holding'),
            (r) => r));
    return right(Send(
      holding: holding,
      amount: Amount(10),
      sendAll: false,
      address:
          PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g', mainnet: false),
      change:
          PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g', mainnet: false),
      feeSelection: FeeSelection.standard,
      memo: Memo('memo string'),
      note: Note('memo is not ipfs'),
      assetUnspents: await _unspentRepository
          .getUnspents(holding)
          .then((value) => value.fold((l) => [], (r) => r)),
      ravenUnspents: await _unspentRepository
          .getUnspents()
          .then((value) => value.fold((l) => [], (r) => r)),
    ));
  }

  @override
  Future<Either<SendFailure, PubKeyAddress>> getChangeAddress() async {
    return right(
        PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g', mainnet: false));
  }
}
