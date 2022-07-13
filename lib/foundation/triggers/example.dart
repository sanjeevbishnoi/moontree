//import 'package:utils/trigger.dart';
//
//class DataModelToDomain extends Trigger {
//  void init() {
//    when(
//      thereIsA: pros.datamodel.table.updated,
//      andIf: null,
//      doThis: (data) async => services.deriveDomainObjectsForThatTable(data),
//    );
//    // several other whens
//  }
//}

/// additioanlly, cubits would listen to domain cache and update the ui
/// reactively
/// 
/// saving to a hive cache would not work for domain level objects, but saving
/// to an in-memory map would work for domain level objects. so either these
/// triggers will do that, or the repositories will pull the inputs and 
/// construct the domain level objects upon demand. I think it's better if the 
/// repositories did not do that. one less thing for them to handle 
/// (transformations, and therefore knowing the data model), and their job can
/// complete quicker if they don't have to care. so I'm pretty sure we really 
/// want the translation to be triggered as soon as data comes in.