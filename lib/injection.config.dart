// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:moontree/application/address/cubit.dart' as _i38;
import 'package:moontree/application/blockchain/cubit.dart' as _i39;
import 'package:moontree/application/holding/cubit.dart' as _i40;
import 'package:moontree/application/send/cubit.dart' as _i32;
import 'package:moontree/application/transaction/cubit.dart' as _i33;
import 'package:moontree/application/wallet/cubit.dart' as _i37;
import 'package:moontree/domain/address/irepository.dart' as _i3;
import 'package:moontree/domain/blockchain/irepository.dart' as _i5;
import 'package:moontree/domain/holding/irepository.dart' as _i7;
import 'package:moontree/domain/send/irepository.dart' as _i11;
import 'package:moontree/domain/transaction/irepository.dart' as _i18;
import 'package:moontree/domain/transactionDetail/irepository.dart' as _i14;
import 'package:moontree/domain/unsignedTransaction/irepository.dart' as _i22;
import 'package:moontree/domain/unsignedTransaction/service_dev.dart' as _i34;
import 'package:moontree/domain/unsignedTransaction/service_test.dart' as _i35;
import 'package:moontree/domain/unspent/irepository.dart' as _i25;
import 'package:moontree/domain/unspent/service.dart' as _i36;
import 'package:moontree/domain/wallet/irepository.dart' as _i28;
import 'package:moontree/infrastructure/address/dev_repository.dart' as _i4;
import 'package:moontree/infrastructure/blockchain/dev_repository.dart' as _i6;
import 'package:moontree/infrastructure/holding/dev_repository.dart' as _i8;
import 'package:moontree/infrastructure/holding/repository.dart' as _i9;
import 'package:moontree/infrastructure/holding/test_repository.dart' as _i10;
import 'package:moontree/infrastructure/send/dev_repository.dart' as _i12;
import 'package:moontree/infrastructure/send/test_repository.dart' as _i13;
import 'package:moontree/infrastructure/transaction/dev_repository.dart'
    as _i19;
import 'package:moontree/infrastructure/transaction/repository.dart' as _i20;
import 'package:moontree/infrastructure/transaction/test_repository.dart'
    as _i21;
import 'package:moontree/infrastructure/transactionDetail/dev_repository.dart'
    as _i15;
import 'package:moontree/infrastructure/transactionDetail/repository.dart'
    as _i16;
import 'package:moontree/infrastructure/transactionDetail/test_repository.dart'
    as _i17;
import 'package:moontree/infrastructure/unsignedTransaction/dev_repository.dart'
    as _i23;
import 'package:moontree/infrastructure/unsignedTransaction/test_repository.dart'
    as _i24;
import 'package:moontree/infrastructure/unspent/dev_repository.dart' as _i26;
import 'package:moontree/infrastructure/unspent/test_repository.dart' as _i27;
import 'package:moontree/infrastructure/wallet/dev_repository.dart' as _i29;
import 'package:moontree/infrastructure/wallet/repository.dart' as _i30;
import 'package:moontree/infrastructure/wallet/test_repository.dart' as _i31;

const String _dev = 'dev';
const String _prod = 'prod';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.IAddressRepository>(() => _i4.AddressRepository(),
      registerFor: {_dev});
  gh.factory<_i5.IBlockchainRepository>(() => _i6.BlockchainRepository(),
      registerFor: {_dev});
  gh.factory<_i7.IHoldingRepository>(() => _i8.HoldingRepository(),
      registerFor: {_dev});
  gh.factory<_i7.IHoldingRepository>(() => _i9.HoldingRepository(),
      registerFor: {_prod});
  gh.factory<_i7.IHoldingRepository>(() => _i10.HoldingRepository(),
      registerFor: {_test});
  gh.factory<_i11.ISendRepository>(() => _i12.SendRepository(),
      registerFor: {_dev});
  gh.factory<_i11.ISendRepository>(() => _i13.SendRepository(),
      registerFor: {_test});
  gh.factory<_i14.ITransactionDetailRepository>(
      () => _i15.TransactionDetailRepository(),
      registerFor: {_dev});
  gh.factory<_i14.ITransactionDetailRepository>(
      () => _i16.TransactionDetailRepository(),
      registerFor: {_prod});
  gh.factory<_i14.ITransactionDetailRepository>(
      () => _i17.TransactionDetailRepository(),
      registerFor: {_test});
  gh.factory<_i18.ITransactionRepository>(() => _i19.TransactionRepository(),
      registerFor: {_dev});
  gh.factory<_i18.ITransactionRepository>(() => _i20.TransactionRepository(),
      registerFor: {_prod});
  gh.factory<_i18.ITransactionRepository>(() => _i21.TransactionRepository(),
      registerFor: {_test});
  gh.factory<_i22.IUnsignedTransactionRepository>(
      () => _i23.UnsignedTransactionRepository(),
      registerFor: {_dev});
  gh.factory<_i22.IUnsignedTransactionRepository>(
      () => _i24.UnsignedTransactionRepository(),
      registerFor: {_test});
  gh.factory<_i25.IUnspentRepository>(() => _i26.UnspentRepository(),
      registerFor: {_dev});
  gh.factory<_i25.IUnspentRepository>(() => _i27.UnspentRepository(),
      registerFor: {_test});
  gh.factory<_i28.IWalletRepository>(() => _i29.WalletRepository(),
      registerFor: {_dev});
  gh.factory<_i28.IWalletRepository>(() => _i30.WalletRepository(),
      registerFor: {_prod});
  gh.factory<_i28.IWalletRepository>(() => _i31.WalletRepository(),
      registerFor: {_test});
  gh.factory<_i32.SendCubit>(() => _i32.SendCubit(
      get<_i11.ISendRepository>(),
      get<_i22.IUnsignedTransactionRepository>(),
      get<_i25.IUnspentRepository>()));
  gh.factory<_i33.TransactionCubit>(
      () => _i33.TransactionCubit(get<_i18.ITransactionRepository>()));
  gh.factory<_i34.UnsignedTransactionService>(
      () => _i34.UnsignedTransactionService(),
      registerFor: {_dev});
  gh.factory<_i35.UnsignedTransactionService>(
      () => _i35.UnsignedTransactionService(),
      registerFor: {_test});
  gh.factory<_i36.UnspentService>(() => _i36.UnspentService());
  gh.factory<_i37.WalletCubit>(
      () => _i37.WalletCubit(get<_i28.IWalletRepository>()));
  gh.factory<_i38.AddressCubit>(
      () => _i38.AddressCubit(get<_i3.IAddressRepository>()));
  gh.factory<_i39.BlockchainCubit>(
      () => _i39.BlockchainCubit(get<_i5.IBlockchainRepository>()));
  gh.factory<_i40.HoldingCubit>(
      () => _i40.HoldingCubit(get<_i7.IHoldingRepository>()));
  return get;
}
