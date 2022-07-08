import 'package:dartz/dartz.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/core/errors.dart';
import 'package:moontree/domain/core/value_object.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/domain/transactionDetail/validators.dart';

class IpfsHash extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  const IpfsHash._(this.value);

  factory IpfsHash(String ipfsHash) => IpfsHash._(validateIpfsHash(ipfsHash));
  factory IpfsHash.empty() => IpfsHash('');
}

enum FeeType {
  transaction,
  create,
  reissue,
  broadcast,
  ipfs, // ipfs storage
}

class Fees extends ValueObject<Map<FeeType, Amount>> {
  @override
  final Either<ValueFailure<Map<FeeType, Amount>>, Map<FeeType, Amount>> value;

  const Fees._(this.value);

  factory Fees(Map<FeeType, Amount> fee) => Fees._(validateFees(fee));
  factory Fees.empty() => Fees(<FeeType, Amount>{});

  Map<String, double> unpack() => value.fold(
        (l) => throw UnexpectedValueError(l),
        (r) => r.map((FeeType k, Amount v) => MapEntry(
              _keyToString(k),
              v.value.fold(
                (l) => throw UnexpectedValueError(l),
                (r) => r,
              ),
            )),
      );

  String _keyToString(FeeType key) {
    switch (key) {
      case FeeType.transaction:
        return 'Transaction Fee';
      case FeeType.create:
        return 'Create Asset Fee';
      case FeeType.reissue:
        return 'Reissue Asset Fee';
      default:
        return '';
    }
  }

  double get transactionFee => value.fold(
        (l) => throw UnexpectedValueError(l),
        (r) => r[FeeType.transaction]!.value.fold(
              (l) => throw UnexpectedValueError(l),
              (r) => r,
            ),
      );
}
