// ignore_for_file: void_checks

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/blockchain/entity.dart';
import 'package:moontree/domain/blockchain/failure.dart';
import 'package:moontree/domain/blockchain/irepository.dart';
import 'package:moontree/domain/wallet/entity.dart';

part 'cubit.freezed.dart';

part 'state.dart';

@injectable
class BlockchainCubit extends Cubit<BlockchainCubitState> {
  final IBlockchainRepository _blockchainRepo;

  BlockchainCubit(this._blockchainRepo) : super(BlockchainCubitState.initial());

  BlockchainCubitState submitting() => state.copyWith(isSubmitting: true);

  Future<BlockchainCubitState> load() async =>
      BlockchainCubitState.load(await _blockchainRepo.getBlockchain());

  void enter() async {
    emit(submitting());
    emit(await load());
  }

  Blockchain _unfold([dynamic error]) => state.blockchain
      .fold((l) => l.map(invalidBlockchain: (_) => error), (r) => r);
  dynamic _unfoldItem(dynamic item, [dynamic error]) =>
      item.value.fold((l) => error, (r) => r);

  int itemCount() => _unfold(0).wallets.length;

  String getProtocol() => _unfold('InvalidBlockchain').protocol.value.fold(
        (l) => 'unknown',
        (r) => r.name,
      );

  List<Wallet> getWallets() => _unfold('InvalidBlockchain').wallets;

  List<String> getWalletNames() => [
        for (Wallet wallet in _unfold('InvalidBlockchain').wallets)
          wallet.name.value.fold((l) => 'InvalidWalletName', (r) => r)
      ];

  Wallet getWalletByName(String name) => getWallets().firstWhere(
      (wallet) => _unfoldItem(wallet.name, 'InvalidWalletName') == name);

  String getWalletName(int index) => _unfoldItem(
      _unfold('InvalidBlockchain').wallets[index].name, 'InvalidWalletName');
}
