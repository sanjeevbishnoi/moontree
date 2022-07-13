/// Each of these files describes a data model entity.
///
/// The server provides data model type entities since it saves the data from
/// the blockchain as these types in it's database. Those data model entities
/// get passed to the device and saved in a local database as such. Domain level
/// aka usecase level entities can then be built up from these data model
/// entities. For more information see foundation/model.drawio

export 'address.dart';
export 'asset.dart';
export 'balance.dart';
export 'transaction.dart';
export 'vin.dart';
export 'vout.dart';
