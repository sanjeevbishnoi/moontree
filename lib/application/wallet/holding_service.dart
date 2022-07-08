import 'package:moontree/domain/holding/entity.dart';

String getName(Holding holding) => holding.name.value.fold(
      (l) => 'unknown',
      (r) => r,
    );

String getFullName(Holding holding) => holding.fullName.value.fold(
      (l) => 'unknown',
      (r) => r,
    );

String getAmount(Holding holding) => holding.amount.value.fold(
      (l) => 'unknown',
      (r) => r.toString(),
    );
