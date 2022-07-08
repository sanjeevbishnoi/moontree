import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/holding/values.dart';
import 'package:moontree_layer_flutter/domain/transaction/entity.dart';
import 'package:moontree_layer_flutter/domain/wallet/values.dart';
import 'package:moontree_layer_flutter/domain/wallet/entity.dart';
import 'package:moontree_layer_flutter/domain/wallet/failure.dart';
import 'package:moontree_layer_flutter/domain/wallet/irepository.dart';

@Environment('test')
@Injectable(as: IWalletRepository)
class WalletRepository implements IWalletRepository {
  const WalletRepository();

  @override
  Future<Either<WalletFailure, Wallet>> getWallet() async => right(Wallet(
          name: WalletName('1'),
          hashedEntropy: HashedEntropy(''),
          privKey: PrivKey(''),
          pubKey: PubKey(''),
          receiveAddress: PubKeyAddress.empty(),
          holdings: [
            Holding(
                fullName: FullName('technicalName'),
                name: Name('full name'),
                assetType: AssetType.unknown,
                amount: Amount(0.0),
                transactions: <Transaction>[]),
            Holding(
                fullName: FullName('RVN'),
                name: Name('Ravencoin'),
                assetType: AssetType.currency,
                amount: Amount(500.0),
                transactions: <Transaction>[]),
            Holding(
                fullName: FullName('MOONTREE'),
                name: Name('Moontree'),
                assetType: AssetType.main,
                amount: Amount(10.0),
                transactions: <Transaction>[]),
          ]));
}
