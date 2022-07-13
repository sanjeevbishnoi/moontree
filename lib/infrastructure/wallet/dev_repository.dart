// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:utils/future.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/wallet/values.dart';
import 'package:moontree/domain/wallet/entity.dart';
import 'package:moontree/domain/wallet/failure.dart';
import 'package:moontree/domain/wallet/irepository.dart';
import 'package:moontree/infrastructure/holding/dev_repository.dart';

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
