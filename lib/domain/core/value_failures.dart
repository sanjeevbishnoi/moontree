import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/blockchain/values.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/transactionDetail/values.dart';

part 'value_failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidAmount(double amount) = InvalidAmount<T>;
  const factory ValueFailure.invalidFullName(String name) = InvalidAssetName<T>;
  const factory ValueFailure.invalidTxId(String txId) = InvalidTxId<T>;
  const factory ValueFailure.invalidTxDate(DateTime date) = InvalidTxDate<T>;
  const factory ValueFailure.invalidTxConfirmations(int txConfirmations) =
      InvalidTxConfirmations<T>;
  const factory ValueFailure.invalidIpfsHash(String ipfsHash) =
      invalidIpfsHash<T>;
  const factory ValueFailure.invalidNote(String note) = invalidNote<T>;
  const factory ValueFailure.invalidMemo(String memo) = invalidMemo<T>;
  const factory ValueFailure.invalidFees(Map<FeeType, Amount> fees) =
      invalidFees<T>;
  const factory ValueFailure.invalidWalletName(String note) =
      invalidWalletName<T>;
  const factory ValueFailure.invalidHashedEntropy(String memo) =
      invalidHashedEntropy<T>;
  const factory ValueFailure.invalidPrivKey(String privKey) = invalidPrivKey<T>;
  const factory ValueFailure.invalidPubKey(String pubKey) = invalidPubKey<T>;
  const factory ValueFailure.invalidPubKeyAddress(String address) =
      invalidPubKeyAddress<T>;
  const factory ValueFailure.invalidDerivationPath(String derivationPath) =
      invalidDerivationPath<T>;
  const factory ValueFailure.invalidTxPosition(int position) =
      invalidTxPosition<T>;
  const factory ValueFailure.invalidLockingScript(String script) =
      invalidLockingScript<T>;
  const factory ValueFailure.invalidProtocol(Protocols protocol) =
      invalidProtocol<T>;
  const factory ValueFailure.invalidTxHash(String txHash) = invalidTxHash<T>;
}
