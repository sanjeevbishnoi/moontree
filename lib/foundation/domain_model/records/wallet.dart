import 'package:equatable/equatable.dart';
import 'package:moontree/foundation/data_model/joins/joins.dart';
import 'package:utils/mixins/string.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/joins/joins.dart';

class DomainWallet with EquatableMixin, ToStringMixin {
  final String name;
  final String hashedEntropy;
  final String priv;
  final String pub;
  final String derivation;

  DomainWallet({
    required this.name,
    required this.hashedEntropy,
    required this.priv,
    required this.pub,
    required this.derivation,
  });

  String get id => generateId(pub);
  static String generateId(String pub) => pub;

  factory DomainWallet.from(
    WalletDeviceRecord wallet, {
    required String hashedEntropy,
    required String privkey,
  }) =>
      DomainWallet(
        name: wallet.id,
        hashedEntropy: hashedEntropy,
        priv: privkey,
        pub: wallet.pubkey,
        derivation: wallet.derivation,
      );

  @override
  List<Object?> get props => [
        name,
        hashedEntropy,
        priv,
        pub,
        derivation,
      ];

  @override
  List<String> get propNames => [
        'name',
        'hashedEntropy',
        'priv',
        'pub',
        'derivation',
      ];

  @override
  bool? get stringify => true;

  String? get receiveAddress => datmodelWallet.nextUnusedAddress?.address;
}
