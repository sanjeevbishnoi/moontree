import 'package:equatable/equatable.dart';
import 'package:moontree_utils/mixins/string.dart';
import 'package:wallet_utils/wallet_utils.dart' show Derivation;
import 'package:moontree/foundation/utils/derivation.dart';
import 'package:moontree/foundation/data_model/joins/joins.dart';
import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/domain_model/joins/joins.dart';

class DomainWallet with EquatableMixin, ToStringMixin {
  final String name;
  final String hashedEntropy;
  final String priv;
  final String pub;
  final String? derivation;

  DomainWallet({
    required this.name,
    required this.hashedEntropy,
    required this.priv,
    required this.pub,
    this.derivation,
  });

  String get id => generateId(pub);
  static String generateId(String pub) => pub;

  factory DomainWallet.from(WalletRecord wallet) => DomainWallet(
        name: wallet.id,
        hashedEntropy: generateEntropy(wallet.mnemonic!),
        priv: generateHDWallet(wallet.mnemonic!).privKey!,
        pub: wallet.pubkey,
        // the domain wallet has 2 hard coded derivation paths.
        // 1. for the receive address
        // 2. for the change address
        // unless, the wallet.derivation is specified by the user...
        // in which case this derivation is used.
        // so if derivation is null the default derivations are used.
        // if its present but empty string, just like the server that indicates
        // a keypair wallet rather than a hierarchical wallet.
        // or the user can specify a derivation path.
        derivation: wallet.derivation == Derivation.getPath()
            ? null
            : wallet.derivation, // should not happen for hd but a bit flexible
      );

  @override
  List<Object?> get props => <Object?>[
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

  String? get receiveAddress =>
      datamodelWalletExternal.nextUnusedAddress?.address;

  String? get changeAddress =>
      datamodelWalletInternal.nextUnusedAddress?.address;
}
