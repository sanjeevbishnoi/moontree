import 'package:dartz/dartz.dart';
import 'package:moontree/domain/address/entity.dart';
import 'package:moontree/domain/address/failure.dart';

abstract class IAddressRepository {
  Future<Either<AddressFailure, Address>> getAddress();
}
