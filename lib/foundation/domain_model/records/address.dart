import 'package:equatable/equatable.dart';
import 'package:moontree_utils/mixins/string.dart';
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
    AddressRecord address, {
    required String walletPub,
  }) =>
      DomainAddress(
        address: address.address,
        walletPub: walletPub,
        index: address.index,
        priv: address.privkey!,
        pub: address.pubkey!,
      );

  @override
  List<Object?> get props => <Object?>[
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
        'index',
        'priv',
        'pub',
      ];

  @override
  bool? get stringify => true;
}
