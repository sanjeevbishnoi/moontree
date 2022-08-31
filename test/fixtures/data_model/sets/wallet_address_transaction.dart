import 'package:moontree/foundation/data_model/records/records.dart';
import 'package:moontree/foundation/utils/derivation.dart';

import 'sets.dart';

class WalletWithAddressAndTransactions extends EmptySet {
  static final mnemonic =
      'strike faint hockey bean average crazy carry spatial hammer glow sorry fiscal';
  static final wallet = WalletDeviceRecord(
    pubkey:
        '03995ebd7d84f6c435391035f45a44cf6bd1d8c0ac627233706d0b0ad0f49a2c6d',
    derivation: "m/44'/175'/0'/0",
    name: 'name',
    mnemonic: mnemonic,
    privkey: '4a72457e41c65f084a798649c3918dd76744baff6023bd3b0f5878fc01c45a7c',
  );
  static final address = generateAddressRecord(
    wallet: wallet,
    index: 0,
    used: false,
  );
  static final walletAddress = WalletAddressDeviceRecord(
    address: address.id,
    pubkey: wallet.pubkey,
    derivation: wallet.derivation,
  );
  static final asset = AssetDeviceRecord(
    symbol: 'MOONTREE',
    reissuable: false,
    supply: 1000,
    divisibility: 4,
  );

  static final exampleHash1 =
      '14ef7d38e41da64613e5fbaaa840ed24c454e61fc0ac72dd7df9ad57a3d80f1f';
  static final exampleHash2 =
      '9e204d8b4d6d7c8e3b3bad594428b2a157c7e96b7a24f4cced93c348ada85f88';
  static final vout1 = VoutDeviceRecord(
    transactionHash: exampleHash1,
    position: 0,
    sats: 100000000,
    lockingScript: '',
    symbol: asset.symbol,
    address: address.address,
  );
  static final vout2 = VoutDeviceRecord(
    transactionHash: exampleHash2,
    position: 0,
    sats: 100000000,
    lockingScript: '',
    symbol: asset.symbol,
    address: address.address,
  );
  static final vin0 = VinDeviceRecord(transactionHash: exampleHash1);
  static final vin1 = VinDeviceRecord(
    transactionHash: exampleHash2,
    voutTransactionHash: vout1.transactionHash,
  );
  static final vin2 = VinDeviceRecord(
    transactionHash: 'exampleHash3',
    voutTransactionHash: vout2.transactionHash,
  );
  static final vin3 = VinDeviceRecord(transactionHash: 'exampleHash4');
  static final transaction1 =
      TransactionDeviceRecord(hash: exampleHash1, height: 1);
  static final transaction2 =
      TransactionDeviceRecord(hash: exampleHash2, height: 2);

  @override
  Map<String, AddressDeviceRecord> get addresses => {address.id: address};

  @override
  Map<String, WalletAddressDeviceRecord> get walletsAddresses =>
      {walletAddress.id: walletAddress};

  @override
  Map<String, WalletDeviceRecord> get wallets => {wallet.id: wallet};

  @override
  Map<String, AssetDeviceRecord> get assets => {asset.id: asset};
  @override
  Map<String, TransactionDeviceRecord> get transactions =>
      {transaction1.id: transaction1, transaction2.id: transaction2};
  @override
  Map<String, VinDeviceRecord> get vins =>
      {vin0.id: vin0, vin1.id: vin1, vin2.id: vin2, vin3.id: vin3};
  @override
  Map<String, VoutDeviceRecord> get vouts => {vout1.id: vout1, vout2.id: vout2};
}
