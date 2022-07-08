import 'package:dartz/dartz.dart';
import 'package:moontree/domain/wallet/entity.dart';
import 'package:moontree/domain/wallet/failure.dart';

abstract class IWalletRepository {
  Future<Either<WalletFailure, Wallet>> getWallet();
}
