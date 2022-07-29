import 'package:equatable/equatable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/entity.dart';
import 'package:moontree/domain/wallet/values.dart';
import 'package:utils/mixins/string.dart';

class DomainWallet with EquatableMixin, ToStringMixin {
  final WalletName name;
  final HashedEntropy hashedEntropy;
  final PrivKey privKey;
  final PubKey pubKey;
  final PubKeyAddress receiveAddress;
  final List<Holding> holdings;

  DomainWallet({
    required this.name,
    required this.hashedEntropy,
    required this.privKey,
    required this.pubKey,
    required this.receiveAddress,
    required this.holdings,
  });

  @override
  List<Object?> get props => [
        name,
        hashedEntropy,
        privKey,
        pubKey,
        receiveAddress,
        holdings,
      ];

  @override
  List<String> get propNames => [
        'name',
        'hashedEntropy',
        'privKey',
        'pubKey',
        'receiveAddress',
        'holdings',
      ];

  @override
  bool? get stringify => true;

  factory DomainWallet.from(dynamic x) => DomainWallet(
        name: x.name,
        hashedEntropy: x.hashedEntropy,
        privKey: x.privKey,
        pubKey: x.pubKey,
        receiveAddress: x.receiveAddress,
        holdings: x.holdings,
      );

  String get id => hashedEntropy.getOrCrash();
}
