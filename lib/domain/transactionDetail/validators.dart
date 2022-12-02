import 'package:dartz/dartz.dart';
import 'package:wallet_utils/wallet_utils.dart' show Validation;
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/core/value_failures.dart';
import 'package:moontree/domain/transactionDetail/values.dart';

Either<ValueFailure<String>, String> validateIpfsHash(String ipfsHash) {
  if (ipfsHash.isNotEmpty && !Validation.isIpfs(ipfsHash)) {
    return left(ValueFailure.invalidIpfsHash(ipfsHash));
  } else {
    return right(ipfsHash);
  }
}

Either<ValueFailure<Map<FeeType, Amount>>, Map<FeeType, Amount>> validateFees(
  Map<FeeType, Amount> fees,
) {
  if (!fees.containsKey(FeeType.transaction)) {
    return left(ValueFailure.invalidFees(fees));
  } else {
    return right(fees);
  }
}
