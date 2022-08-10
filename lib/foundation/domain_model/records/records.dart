/// these "domain" level records are actaully only "domain" in so far as how
/// they relate to one another. They're still filled with raw data and actual
/// domain objects are built up from these very easily.
///
/// for example a holding doesn't have an amount value object in it, it has an
/// int representing sats. Also, it doesn't have 3 value objects that represent
/// an asset, instead assets are a certain object, and all this has is the
/// symbol. In that way it points to an asset object. Futhermore it doesn't
/// have transactions. Instead, when transactions are built, they point to the
/// correct holding object for them.
///
/// So to build up a holding for the front end we simply specify which holding
/// we want in the repository and build the object using join references.
///
export 'address.dart';
export 'asset.dart';
export 'holding.dart';
export 'transaction.dart';
export 'unspent.dart';
export 'wallet.dart';
