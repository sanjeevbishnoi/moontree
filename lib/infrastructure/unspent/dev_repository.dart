// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';
import 'package:moontree_layer_flutter/domain/unspent/failure.dart';
import 'package:moontree_layer_flutter/domain/unspent/irepository.dart';
import 'package:moontree_layer_flutter/domain/unspent/values.dart';
import 'package:moontree_layer_flutter/utils/dev.dart';

@Environment('dev')
@Injectable(as: IUnspentRepository)
class UnspentRepository implements IUnspentRepository {
  const UnspentRepository();

  @override
  Future<Either<UnspentFailure, Unspent>> getUnspent() async {
    await simulateWait('UnspentRepository');
    return right(Unspent(
      txId: TxId(
          '3475fb2080698655b5b2c8331523774dccfaa518a133cb8cff32d03481de6b2d'),
      position: TxPosition(0),
      toAddress: PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g'),
      amount: Amount(1),
      lockingScript: LockingScript(''),
    ));
  }

  /// gets unspents of a particular holding or of the network native coin
  @override
  Future<Either<UnspentFailure, List<Unspent>>> getUnspents(
      [Holding? holding]) async {
    await simulateWait('UnspentsRepository');
    return right([
      Unspent(
        txId: TxId(
            '3475fb2080698655b5b2c8331523774dccfaa518a133cb8cff32d03481de6b2d'),
        position: TxPosition(0),
        toAddress:
            PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g', mainnet: false),
        amount: Amount(1),
        lockingScript: LockingScript(''),
      )
    ]);
  }
}
