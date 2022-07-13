import 'package:equatable/equatable.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/domain/transaction/entity.dart';
import 'package:utils/mixins/string.dart';

class DomainHolding with EquatableMixin, ToStringMixin {
  // link to asset
  final FullName fullName;
  final AssetType assetType;
  final Name name;
  // amount
  final Amount amount;
  // link to
  final List<Transaction> transactions;

  DomainHolding({
    required this.fullName,
    required this.assetType,
    required this.name,
    required this.amount,
    required this.transactions,
  });

  @override
  List<Object?> get props => [
        fullName,
        assetType,
        name,
        amount,
        transactions,
      ];

  @override
  List<String> get propNames => [
        'fullName',
        'assetType',
        'name',
        'amount',
        'transactions',
      ];

  @override
  bool? get stringify => true;

  factory DomainHolding.from(dynamic x) => DomainHolding(
        fullName: x.fullName,
        assetType: x.assetType,
        name: x.name,
        amount: x.amount,
        transactions: x.transactions,
      );

  // needs wallet id
  String get id =>
      '${fullName.getOrCrash()}:${assetType.name}:${amount.getOrCrash()}';
}
