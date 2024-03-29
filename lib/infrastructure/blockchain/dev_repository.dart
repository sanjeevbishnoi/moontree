// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_utils/moontree_utils.dart' show simulateWait;
import 'package:moontree/domain/blockchain/values.dart';
import 'package:moontree/domain/blockchain/entity.dart';
import 'package:moontree/domain/blockchain/failure.dart';
import 'package:moontree/domain/blockchain/irepository.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/wallet/values.dart';
import 'package:moontree/domain/wallet/entity.dart';
import 'package:moontree/infrastructure/holding/dev_repository.dart';

@Environment('dev')
@Injectable(as: IBlockchainRepository)
class BlockchainRepository implements IBlockchainRepository {
  const BlockchainRepository();

  @override
  Future<Either<BlockchainFailure, Blockchain>> getBlockchain() async {
    await simulateWait('BlockchainRepository');
    return right(Blockchain(
      protocol: Protocol(Protocols.ravencoinTestnet),
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
