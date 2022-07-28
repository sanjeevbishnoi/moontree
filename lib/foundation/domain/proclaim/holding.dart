import 'package:collection/collection.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/foundation/domain/records/holding.dart';
import 'package:proclaim/proclaim.dart';

part 'holding.keys.dart';

class HoldingProclaim extends Proclaim<_IdKey, DomainHolding> {
  late IndexMultiple<_IdKey, DomainHolding> byId;

  HoldingProclaim() : super(_IdKey()) {
    byId = addIndexMultiple('id', _IdKey());
  }
}
