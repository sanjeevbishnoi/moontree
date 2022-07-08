// ignore_for_file: void_checks

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/holding/failure.dart';
import 'package:moontree/domain/holding/irepository.dart';
import 'package:moontree/application/holding/transaction_service.dart' as tx;
import 'package:moontree/utils/extensions/string.dart';

part 'cubit.freezed.dart';

part 'state.dart';

@injectable
class HoldingCubit extends Cubit<HoldingCubitState> {
  final IHoldingRepository _holdingRepo;

  HoldingCubit(this._holdingRepo) : super(HoldingCubitState.initial());

  HoldingCubitState submitting() => state.copyWith(isSubmitting: true);

  Future<HoldingCubitState> load() async =>
      HoldingCubitState.load(await _holdingRepo.getHolding());

  void enter() async {
    emit(submitting());
    emit(await load());
  }

  Holding _unfold([dynamic error]) =>
      state.holding.fold((l) => l.map(invalidHolding: (_) => error), (r) => r);

  String getFullName() =>
      _unfold('InvalidHolding').fullName.value.fold((l) => 'unknown', (r) => r);
  String getAssetType() =>
      _unfold('InvalidHolding').assetType.name.toTitleCase();
  String getName() =>
      _unfold('InvalidHolding').name.value.fold((l) => 'unknown', (r) => r);
  String getAmount() => _unfold('InvalidHolding')
      .amount
      .value
      .fold((l) => 'unknown', (r) => r.toString());
  int itemCount() => _unfold(0).transactions.length;

  /// tx

  String getDateType(int index) =>
      tx.getDateType(_unfold('InvalidHolding').transactions[index]);

  String getDate(int index) =>
      tx.getDate(_unfold('InvalidHolding').transactions[index]);

  String getType(int index) =>
      tx.getType(_unfold('InvalidHolding').transactions[index]);

  bool getReceived(int index) =>
      tx.getReceived(_unfold(false).transactions[index]);

  String getTxAmount(int index) =>
      tx.getAmount(_unfold('InvalidHolding').transactions[index]);
}
