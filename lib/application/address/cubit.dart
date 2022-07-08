// ignore_for_file: void_checks

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/address/entity.dart';
import 'package:moontree/domain/address/failure.dart';
import 'package:moontree/domain/address/irepository.dart';

part 'cubit.freezed.dart';

part 'state.dart';

@injectable
class AddressCubit extends Cubit<AddressCubitState> {
  final IAddressRepository _addressRepo;

  AddressCubit(this._addressRepo) : super(AddressCubitState.initial());

  AddressCubitState submitting() => state.copyWith(isSubmitting: true);

  Future<AddressCubitState> load() async =>
      AddressCubitState.load(await _addressRepo.getAddress());

  void enter() async {
    emit(submitting());
    emit(await load());
  }

  Address _unfold([dynamic error]) =>
      state.address.fold((l) => l.map(invalidAddress: (_) => error), (r) => r);

  String getPrivateKey() => _unfold('InvalidAddress').privKey.value.fold(
        (l) => 'unknown',
        (r) => r,
      );

  String getPublicKey() => _unfold('InvalidAddress').pubKey.value.fold(
        (l) => 'unknown',
        (r) => r,
      );

  String getAddress() => _unfold('InvalidAddress').address.value.fold(
        (l) => 'unknown',
        (r) => r,
      );

  String getDerivationPath() =>
      _unfold('InvalidAddress').derivationPath.value.fold(
            (l) => 'unknown',
            (r) => r,
          );
  bool isMainnet() => _unfold('InvalidAddress').derivationPath.isMainnet;
  bool isReceive() => _unfold('InvalidAddress').derivationPath.isReceive;
  bool isRavencoin() => _unfold('InvalidAddress').derivationPath.isRavencoin;
  int getDerivationIndex() => _unfold('InvalidAddress').derivationPath.index;
}
