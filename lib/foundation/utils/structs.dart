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

enum Protocol {
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

enum TxType {
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
