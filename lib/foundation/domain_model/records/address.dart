import 'package:equatable/equatable.dart';
import 'package:utils/mixins/string.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/records/wallet.dart';

class DomainAddress with EquatableMixin, ToStringMixin {
  final String address;
  final String walletPub;
  final int index;
  final String priv;
  final String pub;

  DomainAddress({
    required this.address,
    required this.walletPub,
    required this.index,
    required this.priv,
    required this.pub,
  });

  String get id => address;

  String get walletId => DomainWallet.generateId(walletPub);

  factory DomainAddress.from(
    AddressDeviceRecord address, {
    required String privkey,
    required String pubkey,
    required String walletPub,
    required String walletDerivation,
  }) =>
      DomainAddress(
        address: address.address,
        walletPub: walletPub,
        index: address.index,
        priv: privkey,
        pub: pubkey,
      );

  @override
  List<Object?> get props => [
        address,
        walletPub,
        index,
        priv,
        pub,
      ];

  @override
  List<String> get propNames => [
        'address',
        'walletPub',
        'walletDerivation',
        'index',
        'priv',
        'pub',
      ];

  @override
  bool? get stringify => true;
}
