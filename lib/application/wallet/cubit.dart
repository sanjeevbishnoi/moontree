// ignore_for_file: void_checks

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/wallet/entity.dart';
import 'package:moontree/domain/wallet/failure.dart';
import 'package:moontree/domain/wallet/irepository.dart';
import 'package:moontree/application/wallet/holding_service.dart' as holding;

part 'cubit.freezed.dart';

part 'state.dart';

@injectable
class WalletCubit extends Cubit<WalletCubitState> {
  final IWalletRepository _walletRepo;

  WalletCubit(this._walletRepo) : super(WalletCubitState.initial());

  WalletCubitState submitting() => state.copyWith(isSubmitting: true);

  Future<WalletCubitState> load() async =>
      WalletCubitState.load(await _walletRepo.getWallet());

  void enter() async {
    emit(submitting());
    emit(await load());
  }

  Wallet _unfold([dynamic error]) =>
      state.wallet.fold((l) => l.map(invalidWallet: (_) => error), (r) => r);

  int itemCount() => _unfold(0).holdings.length;

  String getName(int index) => _unfold('InvalidWallet').name.value.fold(
        (l) => 'unknown',
        (r) => r,
      );

  String getReceiveAddress() =>
      _unfold('InvalidWallet').receiveAddress.value.fold(
            (l) => 'unknown',
            (r) => r,
          );

  /// holding

  String getHoldingName(int index) =>
      holding.getName(_unfold('InvalidWallet').holdings[index]);

  String getHoldingFullName(int index) =>
      holding.getFullName(_unfold('InvalidWallet').holdings[index]);

  String getHoldingAmount(int index) =>
      holding.getAmount(_unfold('InvalidWallet').holdings[index]);
}
