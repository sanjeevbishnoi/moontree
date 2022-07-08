// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/wallet/values.dart';
import 'package:moontree_layer_flutter/domain/wallet/entity.dart';
import 'package:moontree_layer_flutter/domain/wallet/failure.dart';
import 'package:moontree_layer_flutter/domain/wallet/irepository.dart';
import 'package:moontree_layer_flutter/infrastructure/holding/dev_repository.dart';
import 'package:moontree_layer_flutter/utils/dev.dart';

@Environment('dev')
@Injectable(as: IWalletRepository)
class WalletRepository implements IWalletRepository {
  const WalletRepository();

  @override
  Future<Either<WalletFailure, Wallet>> getWallet() async {
    await simulateWait('WalletRepository');
    return right(Wallet(
      name: WalletName('1'),
      hashedEntropy: HashedEntropy(''),
      privKey: PrivKey(''),
      pubKey: PubKey(''),
      // mainnet is ancillary data,
      // this wallet is held within a Blockchain,
      // so mainnet settings has to get passed all the way through
      receiveAddress:
          PubKeyAddress('mzfbwR9GRXNgAdNzUj7ebCNgRhkPuJR5JJ', mainnet: false),
      holdings: await const HoldingRepository()
          .getHoldings()
          .then((value) => value.fold((l) => [Holding.empty()], (r) => r)),
    ));
  }
}
