import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree_layer_flutter/domain/address/values.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';

part 'entity.freezed.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    required PrivKey privKey,
    required PubKey pubKey,
    required PubKeyAddress address,
    required DerivationPath derivationPath,
  }) = _Address;

  factory Address.empty() => Address(
        address: PubKeyAddress(''),
        derivationPath: DerivationPath(''),
        privKey: PrivKey(''),
        pubKey: PubKey(''),
      );
}
