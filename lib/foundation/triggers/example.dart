/// pseudo code for converting data model into domain cache
//
//import 'trigger.dart';
//
//class DataModelToDomain extends Trigger {
//  void init() {
//    when(
//      thereIsA: reservoir.datamodel.table.updated,
//      andIf: null,
//      doThis: (data) async => services.deriveDomainObjectsForThatTable(data),
//    );
//    // several other whens
//  }
//}
//

/// additioanlly, cubits would listen to domain cache and update the ui
/// reactively