import 'package:equatable/equatable.dart';
import 'package:utils/mixins/string.dart';

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
