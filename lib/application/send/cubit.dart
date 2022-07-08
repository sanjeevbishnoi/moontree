// ignore_for_file: void_checks

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/core/errors.dart';
import 'package:moontree_layer_flutter/domain/holding/entity.dart';
import 'package:moontree_layer_flutter/domain/send/entity.dart';
import 'package:moontree_layer_flutter/domain/send/failure.dart';
import 'package:moontree_layer_flutter/domain/send/irepository.dart';
import 'package:moontree_layer_flutter/domain/send/values.dart';
import 'package:moontree_layer_flutter/domain/transaction/entity.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/entity.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/failure.dart';
import 'package:moontree_layer_flutter/domain/unsignedTransaction/irepository.dart';
import 'package:moontree_layer_flutter/domain/unspent/entity.dart';
import 'package:moontree_layer_flutter/domain/unspent/irepository.dart';

part 'cubit.freezed.dart';

part 'state.dart';

extension GetOrCrashOnState on Either<SendFailure, Send> {
  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  Send get() => fold((l) => throw Exception('.get failure'), (r) => r);
}

@injectable
class SendCubit extends Cubit<SendCubitState> {
  final ISendRepository _sendRepo;
  final IUnsignedTransactionRepository _unsignedRepo;
  final IUnspentRepository _unspentRepo;

  SendCubit(this._sendRepo, this._unsignedRepo, this._unspentRepo)
      : super(SendCubitState.initial());

  SendCubitState submitting() => state.copyWith(isSubmitting: true);

  Future<SendCubitState> load() async => SendCubitState.load(
      send: await _sendRepo.getSend(),
      unsignedTransaction: right(UnsignedTransaction.empty()));

  Future<SendCubitState> setHolding(Holding holding) async =>
      SendCubitState.load(
          // .get() mmmm...
          send: right(state.send.get().copyWith(holding: holding)),
          unsignedTransaction: state.unsignedTransaction);

  Future<SendCubitState> setAmount(Amount amount) async => SendCubitState.load(
      send: state.send.fold((l) => throw Exception('.get?'),
          (r) => right(r.copyWith(amount: amount))),
      unsignedTransaction: state.unsignedTransaction);

  Future<SendCubitState> setToAddress(PubKeyAddress toAddress) async =>
      SendCubitState.load(
          send: state.send.fold((l) => throw Exception('.get?'),
              (r) => right(r.copyWith(address: toAddress))),
          unsignedTransaction: state.unsignedTransaction);

  Future<SendCubitState> setFeeSelection(FeeSelection feeSelection) async =>
      SendCubitState.load(
          send: state.send.fold((l) => throw Exception('.get?'),
              (r) => right(r.copyWith(feeSelection: feeSelection))),
          unsignedTransaction: state.unsignedTransaction);

  Future<SendCubitState> setMemo(Memo memo) async => SendCubitState.load(
      send: state.send.fold((l) => throw Exception('.get?'),
          (r) => right(r.copyWith(memo: memo))),
      unsignedTransaction: state.unsignedTransaction);

  Future<SendCubitState> setNote(Note note) async => SendCubitState.load(
      send: state.send.fold((l) => throw Exception('.get?'),
          (r) => right(r.copyWith(note: note))),
      unsignedTransaction: state.unsignedTransaction);

  Future<SendCubitState> setChange(PubKeyAddress change) async =>
      SendCubitState.load(
          send: state.send.fold((l) => throw Exception('.get?'),
              (r) => right(r.copyWith(change: change))),
          unsignedTransaction: state.unsignedTransaction);

  Future<SendCubitState> setRavenUnspents(List<Unspent> unspents) async =>
      SendCubitState.load(
          send: state.send.fold((l) => throw Exception('.get?'),
              (r) => right(r.copyWith(ravenUnspents: unspents))),
          unsignedTransaction: state.unsignedTransaction);

  Future<SendCubitState> setAssetUnspents(List<Unspent> unspents) async =>
      SendCubitState.load(
          send: state.send.fold((l) => throw Exception('.get?'),
              (r) => right(r.copyWith(assetUnspents: unspents))),
          unsignedTransaction: state.unsignedTransaction);

  Future<SendCubitState> submitSend() async => SendCubitState.load(
        send: state.send,
        unsignedTransaction: state.send
                .getOrElse(() => throw Exception('.get?'))
                .sendAll
            ? await _unsignedRepo.generateUnsignedTransactionSweepOne(state.send
                .getOrElse(() =>
                    throw Exception('unable to generate UnsignedTransaction')))
            : await _unsignedRepo.generateUnsignedTransaction(state.send
                .getOrElse(() =>
                    throw Exception('unable to generate UnsignedTransaction'))),
      );

  Future<SendCubitState> submitSendAll() async => SendCubitState.load(
        send: state.send,
        unsignedTransaction: await _unsignedRepo
            .generateUnsignedTransactionSweepOne(state.send.getOrElse(() =>
                throw Exception('unable to generate UnsignedTransaction'))),
      );

  void enter() async {
    emit(submitting());
    emit(await load());
    // get this from server - which repository does it belong in? send?
    submitChangeAddress(
        PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g', mainnet: false));
  }

  void choose(dynamic item) async {
    emit(submitting());
    if (item is Holding) {
      emit(await setHolding(item));
      submitRavenUnspents(await _unspentRepo
          .getUnspents()
          .then((value) => value.fold((l) => [], (r) => r)));
      if (!item.isRavencoin) {
        submitAssetUnspents(await _unspentRepo
            .getUnspents(
                state.send.getOrElse(() => throw Exception('.get?')).holding)
            .then((value) => value.fold((l) => [], (r) => r)));
      }
    }
    if (item is Amount) {
      emit(await setAmount(item));
    }
    if (item is FeeSelection) {
      emit(await setFeeSelection(item));
    }
    if (item is PubKeyAddress) {
      emit(await setToAddress(item));
    }
    if (item is Memo) {
      emit(await setMemo(item));
    }
    if (item is Note) {
      emit(await setNote(item));
    }
  }

  // automatically called
  void submitChangeAddress(PubKeyAddress change) async =>
      emit(await setChange(change));
  void submitRavenUnspents(List<Unspent> unspents) async =>
      emit(await setRavenUnspents(unspents));
  void submitAssetUnspents(List<Unspent> unspents) async =>
      emit(await setAssetUnspents(unspents));

  void submit() async {
    emit(submitting());
    emit(await submitSend());
    // here we get redirected to a new page (confirmation page)
    // while there the transaction is created, using the unspents we've chosen
    // and the fee is added to the send object, as well as the next object,
    // the details of the send object and the unsigned transaction object are
    // shown to the user once the unsigned transaction is created,
    // and they can click to confirm the send, at which time everything gets
    // signed and broadcasted.
  }

  // helper functions

  Send _unfold([dynamic error = 'InvalidSend']) =>
      state.send.fold((l) => l.map(invalidSend: (_) => error), (r) => r);
  UnsignedTransaction _unfoldUnsigned(
          [dynamic error = 'InvalidUnsignedTransaction']) =>
      state.unsignedTransaction.fold(
          (l) => l.map(
                sendHasNoRavenForFee: (_) => error,
                invalidUnsignedTransaction: (_) => error,
                sendAmountLargerThanSendUnspents: (_) => error,
                sendAmountAndFeeLargerThanSendUnspents: (_) => error,
              ),
          (r) => r);
  dynamic _unfoldItem(dynamic item, [dynamic error = 'unknown']) =>
      item.value.fold((l) => error, (r) => r);

  // holding

  Holding getHolding() => _unfold().holding;
  String getHoldingFullName() => _unfoldItem(_unfold().holding.fullName);
  String getHoldingName() => _unfoldItem(_unfold().holding.name);
  String getHoldingAssetType() => _unfold().holding.assetType.name;
  double getHoldingAmount() => _unfoldItem(_unfold().holding.amount, 0.0);
  List<Transaction> getHoldingTransactions() => _unfold().holding.transactions;

  // attributes

  double getAmount() => _unfoldItem(_unfold().amount, 0.0);
  String getToAddress() => _unfoldItem(_unfold().address);
  String getChangeAddress() => _unfoldItem(_unfold().change);
  String getFeeSelection() => _unfold().feeSelection.name;
  String getMemo() => _unfoldItem(_unfold().memo);
  String getNote() => _unfoldItem(_unfold().note);
  bool getSendAll() => _unfold().sendAll;

  // unspents

  int getUnspentCount([bool rvn = true]) =>
      rvn ? _unfold(0).ravenUnspents.length : _unfold(0).assetUnspents.length;
  Unspent getUnspent(int i, [bool rvn = true]) =>
      rvn ? _unfold().ravenUnspents[i] : _unfold().assetUnspents[i];
  double getUnspentAmount(int i, [bool rvn = true]) => rvn
      ? _unfoldItem(_unfold().ravenUnspents[i].amount, 0.0)
      : _unfoldItem(_unfold().assetUnspents[i].amount, 0.0);
  String getUnspentLockingScript(int i, [bool rvn = true]) => rvn
      ? _unfoldItem(
          _unfold().ravenUnspents[i].lockingScript, 'InvalidLockingScript')
      : _unfoldItem(
          _unfold().assetUnspents[i].lockingScript, 'InvalidLockingScript');
  int getUnspentPosition(int i, [bool rvn = true]) => rvn
      ? _unfoldItem(_unfold().ravenUnspents[i].position, 0)
      : _unfoldItem(_unfold().assetUnspents[i].position, 0);
  String getUnspentTo(int i, [bool rvn = true]) => rvn
      ? _unfoldItem(_unfold().ravenUnspents[i].toAddress, 'InvalidTo')
      : _unfoldItem(_unfold().assetUnspents[i].toAddress, 'InvalidTo');
  String getUnspentTxId(int i, [bool rvn = true]) => rvn
      ? _unfoldItem(_unfold().ravenUnspents[i].txId, 'InvalidTxId')
      : _unfoldItem(_unfold().assetUnspents[i].txId, 'InvalidTxId');

  // unsignedTransaction

  List<Unspent> getChosenUnspents() =>
      _unfoldItem(_unfoldUnsigned().chosenUnspents, 0.0);
  bool getSigned() => _unfoldItem(_unfoldUnsigned().signed);
  String getFee() => _unfoldItem(_unfoldUnsigned().fee);
  String getTxHash() => _unfoldItem(_unfoldUnsigned().txHash);
}
