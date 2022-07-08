import 'package:dartz/dartz.dart';
import 'package:moontree_layer_flutter/domain/address/entity.dart';
import 'package:moontree_layer_flutter/domain/address/failure.dart';

abstract class IAddressRepository {
  Future<Either<AddressFailure, Address>> getAddress();
}
