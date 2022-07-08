import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/errors.dart';
import 'package:moontree/domain/core/value_object.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/domain/transaction/validators.dart';
import 'package:date_format/date_format.dart';

enum SentReceived {
  sent,
  received,
}

enum TxTypeOptions {
  transfer,
  self,
  fee,
  burn,
  creation,
  reissue,
  dividend,
  message,
  tag,
  unknown,
}

class TxType extends ValueObject<TxTypeOptions> {
  @override
  final Either<ValueFailure<TxTypeOptions>, TxTypeOptions> value;

  const TxType._(this.value);

  factory TxType(TxTypeOptions txType) => TxType._(right(txType));
  factory TxType.empty() => TxType(TxTypeOptions.unknown);

  String get asText => value.fold(
        (l) => throw UnexpectedValueError(l),
        (r) {
          switch (r) {
            case TxTypeOptions.transfer:
              return '';
            case TxTypeOptions.self:
              return 'Sent to Self';
            case TxTypeOptions.fee:
              return 'Transaction Fee'; // rvn view, sent asset
            case TxTypeOptions.burn:
              return 'Burn';
            case TxTypeOptions.creation:
              return 'Asset Creation';
            case TxTypeOptions.reissue:
              return 'Reissue';
            case TxTypeOptions.dividend:
              return 'Dividend';
            case TxTypeOptions.message:
              return 'Sent Message';
            case TxTypeOptions.tag:
              return 'Tag';
            default:
              return '';
          }
        },
      );
}

class TxConfirmations extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  const TxConfirmations._(this.value);

  factory TxConfirmations(int txConfirmations) =>
      TxConfirmations._(validateTxConfirmations(txConfirmations));
  factory TxConfirmations.empty() => TxConfirmations(0);

  /// 0 == mempool
  bool get isMempool => value.fold(
        (l) => throw UnexpectedValueError(l),
        (r) => r == 0,
      );
}

/// miners add the date it can be whatever they say. Why should we validate it?
/// also, what if it's a mempool transaction? no date.
/// I guess this object would be given now by the repository, but that's a lie.
class TxDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  const TxDate._(this.value);

  factory TxDate(DateTime date) => TxDate._(validateTxDate(date));
  factory TxDate.empty() => TxDate(DateTime.now());

  String asString() => value.fold(
        (l) => throw UnexpectedValueError(l),
        (r) => formatDate(r, [MM, ' ', d, ', ', yyyy]),
      );
}
