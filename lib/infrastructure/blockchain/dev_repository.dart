// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/blockchain/values.dart';
import 'package:moontree_layer_flutter/domain/blockchain/entity.dart';
import 'package:moontree_layer_flutter/domain/blockchain/failure.dart';
import 'package:moontree_layer_flutter/domain/blockchain/irepository.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/wallet/values.dart';
import 'package:moontree_layer_flutter/domain/wallet/entity.dart';
import 'package:moontree_layer_flutter/infrastructure/holding/dev_repository.dart';
import 'package:moontree_layer_flutter/utils/dev.dart';

@Environment('dev')
@Injectable(as: IBlockchainRepository)
class BlockchainRepository implements IBlockchainRepository {
  const BlockchainRepository();

  @override
  Future<Either<BlockchainFailure, Blockchain>> getBlockchain() async {
    await simulateWait('BlockchainRepository');
    return right(Blockchain(
      protocol: Protocol(Protocols.RavencoinTestnet),
      wallets: <Wallet>[
        Wallet(
            name: WalletName('name'),
            hashedEntropy: HashedEntropy('hashedEntropy'),
            privKey: PrivKey('privKey'),
            pubKey: PubKey('pubKey'),
            receiveAddress: PubKeyAddress('receiveAddress'),
            holdings: <Holding>[]),
        Wallet(
          name: WalletName('name2'),
          hashedEntropy: HashedEntropy('hashedEntropy2'),
          privKey: PrivKey('privKey2'),
          pubKey: PubKey('pubKey2'),
          receiveAddress: PubKeyAddress('receiveAddress2'),
          holdings: await HoldingRepository()
              .getHoldings()
              .then((value) => value.fold((l) => [], (r) => r)),
        )
      ],
    ));
  }
}
