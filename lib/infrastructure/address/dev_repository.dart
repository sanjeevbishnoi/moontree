// ignore_for_file: avoid_print
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:moontree/domain/address/values.dart';
import 'package:moontree/domain/address/entity.dart';
import 'package:moontree/domain/address/failure.dart';
import 'package:moontree/domain/address/irepository.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/utils/dev.dart';

@Environment('dev')
@Injectable(as: IAddressRepository)
class AddressRepository implements IAddressRepository {
  const AddressRepository();

  @override
  Future<Either<AddressFailure, Address>> getAddress() async {
    await simulateWait('AddressRepository');
    return right(Address(
      address:
          PubKeyAddress('mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g', mainnet: false),
      derivationPath: DerivationPath("m/44'/175'/0'/0/0"),
      privKey: PrivKey(
          '0d21d3410668f55c204b0614f45ff903a1f58c5572923b7f10950789e05cef69'),
      pubKey: PubKey(
          '030073395d85af0718a541ceeb256a44321ea7b50e62295bbb76b67155216b32b1'),
    ));
  }
}
