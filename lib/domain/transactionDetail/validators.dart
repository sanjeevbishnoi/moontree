import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/core/value_failures.dart';
import 'package:moontree_layer_flutter/domain/transactionDetail/values.dart';
import 'package:moontree_layer_flutter/utils/validation.dart' show isIpfs;

Either<ValueFailure<String>, String> validateIpfsHash(String ipfsHash) {
  if (ipfsHash.isNotEmpty && !isIpfs(ipfsHash)) {
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
