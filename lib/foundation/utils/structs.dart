/// Consider this issue of duplicating these structures in the domain layer and
/// the foundation layer. AssetType is duplicated in domain/holding/values.dart
/// just as each of these are duplicated in domain somewhere. Should domain pull
/// from here and use theses structures? what if the data model in the database
/// changes? how we have to change the domain (which is essentially actually the
/// "usecases" domain, or the UI domain). That's less ideal than duplication.
/// Well, what if we import from the domain model? then our database structure
/// is stuck to the same structure, and any change to these structures on the UI
/// will require us to migrate the datbase. That's even worse! Each layer has
/// its own datastruture and therefore it's own "domain" thus, we actually
/// _should_ duplicate these datastructures even though they currently match.
///
/// So the UI domain pulls from these unless and until it's needs change in
/// which case everthing above the domain pulls from it and it can define it's
/// own structures. But the reservoirs will have to convert from these to those.
///

enum AssetType {
  unknown,
  currency,
  main,
  admin,
  restricted,
  nft,
  channel,
  qualifier,
}

enum Protocols {
  ravencoinTestnet,
  ravencoinMainnet,
  evrmoreTestnet,
  evrmoreMainnet,
  fiat,
  unknown,
}

enum SentReceived {
  sent,
  received,
}

enum TxTypes {
  transfer,
  self,
  fee,
  burn,
  creation,
  reissue,
  dividend,
  message,
  tag,
  unknown,
}

enum FeeType {
  transaction,
  create,
  reissue,
  broadcast,
  ipfs, // ipfs storage
}
