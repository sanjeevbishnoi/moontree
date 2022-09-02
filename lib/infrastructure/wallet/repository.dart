import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree/foundation/domain_model/proclaim/proclaim.dart'
    as domain;
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/wallet/values.dart';
import 'package:moontree/domain/wallet/entity.dart';
import 'package:moontree/domain/wallet/failure.dart';
import 'package:moontree/domain/wallet/irepository.dart';
import 'package:moontree/infrastructure/holding/repository.dart';

@Environment('prod')
@Injectable(as: IWalletRepository)
class WalletRepository implements IWalletRepository {
  const WalletRepository();

  @override
  Future<Either<WalletFailure, Wallet>> getWallet() async {
    final w = domain.wallets.records.first;
    return right(Wallet(
      name: WalletName(w.name),
      hashedEntropy: HashedEntropy(w.hashedEntropy),
      privKey: PrivKey(w.priv),
      pubKey: PubKey(w.pub),
      receiveAddress: PubKeyAddress(w.receiveAddress ?? 'unknown'),
      holdings: await const HoldingRepository()
          .getHoldings()
          .then((value) => value.fold((l) => [Holding.empty()], (r) => r)),
    ));
  }
}
