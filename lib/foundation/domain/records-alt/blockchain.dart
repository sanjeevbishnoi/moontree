import 'package:equatable/equatable.dart';
import 'package:moontree/domain/blockchain/values.dart';
import 'package:moontree/domain/wallet/entity.dart';
import 'package:utils/mixins/string.dart';

class DomainBlockchain with EquatableMixin, ToStringMixin {
  final Protocol protocol;
  final List<Wallet> wallets;

  DomainBlockchain({
    required this.protocol,
    required this.wallets,
  });

  @override
  List<Object?> get props => [
        protocol,
        wallets,
      ];

  @override
  List<String> get propNames => [
        'protocol',
        'wallets',
      ];

  @override
  bool? get stringify => true;

  factory DomainBlockchain.from(dynamic x) => DomainBlockchain(
        protocol: x.protocol,
        wallets: x.wallets,
      );

  String get id => protocol.getOrCrash().name;
}
