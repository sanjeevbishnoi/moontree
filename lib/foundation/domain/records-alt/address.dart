import 'package:moontree/domain/address/values.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:equatable/equatable.dart';
import 'package:utils/mixins/string.dart';

class DomainAddress with EquatableMixin, ToStringMixin {
  // needs wallet id
  final PubKeyAddress address;
  final DerivationPath derivationPath;
  final PrivKey privKey;
  final PubKey pubKey;

  DomainAddress({
    required this.address,
    required this.derivationPath,
    required this.privKey,
    required this.pubKey,
  });

  @override
  List<Object?> get props => [
        address,
        derivationPath,
        privKey,
        pubKey,
      ];

  @override
  List<String> get propNames => [
        'address',
        'derivationPath',
        'privKey',
        'pubKey',
      ];

  @override
  bool? get stringify => true;

  factory DomainAddress.from(dynamic x) => DomainAddress(
        address: x.address,
        derivationPath: x.derivationPath,
        privKey: x.privKey,
        pubKey: x.pubKey,
      );

  String get id => address.getOrCrash();
}
