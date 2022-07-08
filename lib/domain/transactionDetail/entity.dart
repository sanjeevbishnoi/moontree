import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/domain/transaction/values.dart';
import 'package:moontree/domain/transactionDetail/values.dart';

part 'entity.freezed.dart';

@freezed
abstract class TransactionDetail with _$TransactionDetail {
  const factory TransactionDetail({
    required TxId txId,
    required TxType type,
    required SentReceived sentReceived,
    required Amount amount,
    required TxConfirmations confirmations,
    required TxDate date,
    required FullName fullName,
    required AssetType assetType,
    required Name name,
    required Fees fees,
    required IpfsHash ipfsHash,
    required Note note,
    required Memo memo,
  }) = _TransactionDetail;

  factory TransactionDetail.emptyRVN() => TransactionDetail(
        txId: TxId(''),
        type: TxType(TxTypeOptions.transfer),
        sentReceived: SentReceived.received,
        amount: Amount(0.0),
        confirmations: TxConfirmations(0),
        date: TxDate(DateTime.now()),
        fullName: FullName('RVN'),
        assetType: AssetType.currency,
        name: Name('Ravencoin'),
        fees: Fees({}),
        ipfsHash: IpfsHash(''),
        note: Note(''),
        memo: Memo(''),
      );

  factory TransactionDetail.empty() => TransactionDetail(
        txId: TxId(''),
        type: TxType(TxTypeOptions.transfer),
        sentReceived: SentReceived.received,
        amount: Amount(0.0),
        confirmations: TxConfirmations(0),
        date: TxDate(DateTime.now()),
        fullName: FullName(''),
        assetType: AssetType.unknown,
        name: Name(''),
        fees: Fees({}),
        ipfsHash: IpfsHash(''),
        note: Note(''),
        memo: Memo(''),
      );
}
