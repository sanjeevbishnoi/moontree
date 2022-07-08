// ignore_for_file: void_checks

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/transaction/entity.dart';
import 'package:moontree/domain/transaction/failure.dart';
import 'package:moontree/domain/transaction/irepository.dart';
import 'package:moontree/domain/transaction/values.dart';
import 'package:moontree/application/transaction/transactionDetails_service.dart'
    as details;

part 'cubit.freezed.dart';

part 'state.dart';

@injectable
class TransactionCubit extends Cubit<TransactionCubitState> {
  final ITransactionRepository _transactionRepo;

  TransactionCubit(this._transactionRepo)
      : super(TransactionCubitState.initial());

  TransactionCubitState submitting() => state.copyWith(isSubmitting: true);

  Future<TransactionCubitState> load() async =>
      TransactionCubitState.load(await _transactionRepo.getTransaction());

  void enter() async {
    emit(submitting());
    emit(await load());
  }

  Transaction _unfold([dynamic error]) => state.transaction
      .fold((l) => l.map(invalidTransaction: (_) => error), (r) => r);

  String getDateType() {
    final date = getDate();
    final type = getType();
    return type == '' ? date : '$date | $type';
  }

  String getTxId() =>
      _unfold('InvalidTransaction').txId.value.fold((l) => 'unknown', (r) => r);

  String getType() => _unfold('InvalidTransaction').type.asText;

  String getDate() {
    final r = _unfold('InvalidTransaction');
    return r.confirmations.isMempool ? 'In Transit' : r.date.asString();
  }

  String getConfirmations() =>
      _unfold(0).confirmations.value.fold((l) => 0, (r) => r).toString();

  bool isReceived() => _unfold(false).sentReceived == SentReceived.received;

  String getAmount() => _unfold('InvalidTransaction').amount.value.fold(
        (l) => 'unknown',
        (r) => r.toString(),
      );

  /// transactionDetail

  /// what? do we show the nested entity details here (transactionDetail)
  /// or... do we make the presentation layer use a different cubit for those?
  /// or... do we use a service or something?

  String getDetailTxId() =>
      details.getTxId(_unfold('unknown').transactionDetail);
  String getDetailAmount() =>
      details.getAmount(_unfold('unknown').transactionDetail);
  String getDetailType() =>
      details.getType(_unfold('unknown').transactionDetail);
  bool isDetailReceived() =>
      details.isReceived(_unfold('unknown').transactionDetail);
  String getDetailConfirmations() =>
      details.getConfirmations(_unfold('unknown').transactionDetail).toString();
  String getDetailDate() =>
      details.getDate(_unfold('unknown').transactionDetail);
  String getDetailFullName() =>
      details.getFullName(_unfold('unknown').transactionDetail);
  String getDetailName() =>
      details.getName(_unfold('unknown').transactionDetail);
  String getDetailAssetType() =>
      details.getAssetType(_unfold('unknown').transactionDetail);
  String getDetailTransactionFee() =>
      details.getTransactionFee(_unfold('unknown').transactionDetail);
  Map<String, double> getDetailFees() =>
      details.getFees(_unfold('unknown').transactionDetail);
  String getDetailIpfsHash() =>
      details.getIpfsHash(_unfold('unknown').transactionDetail);
  String getDetailMemo() =>
      details.getMemo(_unfold('unknown').transactionDetail);
  String getDetailNote() =>
      details.getNote(_unfold('unknown').transactionDetail);
}
