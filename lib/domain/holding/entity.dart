import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moontree_layer_flutter/domain/core/common/values.dart';
import 'package:moontree_layer_flutter/domain/holding/values.dart';
import 'package:moontree_layer_flutter/domain/transaction/entity.dart';

part 'entity.freezed.dart';

@freezed
abstract class Holding with _$Holding {
  const factory Holding({
    required FullName fullName,
    required AssetType assetType,
    required Name name,
    required Amount amount,
    required List<Transaction> transactions,
  }) = _Holding;

  factory Holding.emptyRVN() => Holding(
        fullName: FullName('RVN'),
        assetType: AssetType.currency,
        name: Name('Ravencoin'),
        amount: Amount(0.0),
        transactions: <Transaction>[],
      );

  factory Holding.empty() => Holding(
        fullName: FullName(''),
        assetType: AssetType.unknown,
        name: Name(''),
        amount: Amount(0.0),
        transactions: <Transaction>[],
      );
}

/** by the way, I think you can add functionality to entities this way, maybe
mixin MyMixin {
  foo(int param) { print("Mixin::foo $param");}
}
class Derived extends Base with MyMixin {
}
*/
extension ShortcutsForHolding on Holding {
  bool get isRavencoin => fullName.getOrCrash() == 'RVN';
}
