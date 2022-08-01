import 'package:equatable/equatable.dart';
import 'package:utils/mixins/string.dart';
import 'package:moontree/foundation/data_model/records/records.dart';

class DomainWallet with EquatableMixin, ToStringMixin {
  final String name;
  final String hashedEntropy;
  final String priv;
  final String pub;
  final String derivation;
  final String receiveAddress;

  DomainWallet({
    required this.name,
    required this.hashedEntropy,
    required this.priv,
    required this.pub,
    required this.derivation,
    required this.receiveAddress,
  });

  String get id => generateId(pub, derivation);
  static String generateId(String pub, String derviation) => '$pub:$derviation';

  factory DomainWallet.from(
    WalletDeviceRecord wallet,
    String hashedEntropy,
    String privkey,
    String receiveAddress, // should we remove this?
  ) =>
      DomainWallet(
        name: wallet.id,
        hashedEntropy: hashedEntropy,
        priv: privkey,
        pub: wallet.pubkey,
        derivation: wallet.derivation ?? '',
        receiveAddress: receiveAddress,
      );

  @override
  List<Object?> get props => [
        name,
        hashedEntropy,
        priv,
        pub,
        derivation,
        receiveAddress,
      ];

  @override
  List<String> get propNames => [
        'name',
        'hashedEntropy',
        'priv',
        'pub',
        'derivation',
        'receiveAddress',
      ];

  @override
  bool? get stringify => true;
}
