// ignore_for_file: omit_local_variable_types

import 'package:equatable/equatable.dart';
import 'package:moontree/foundation/domain/records/records.dart';
import 'package:ravencoin_wallet/ravencoin_wallet.dart' show HDWallet;
import 'package:bip39/bip39.dart' as bip39;
import 'package:moontree/foundation/data_model/proclaim/proclaim.dart'
    as datamodel;

// derives addresses for leaderwallets
class LeaderWalletService {
  final int requiredGap = 20;

/* whatever is valuable in here needs to be re-written for the model of a wallet

  Future<void> newLeaderProcess(DomainWallet leader) async {
    var generate = requiredGap;
    var addresses = [];
    while (generate > 0) {
      var futures = <Future<Address>>[
        for (var i = target - generate; i < target; i++)
          () async {
            return deriveAddress(leader, i, exposure: exposure);
          }()
      ];
      var currentAddresses = (await Future.wait(futures)).toList();
      addresses.addAll(currentAddresses);
    }
    await datamodel.addresses.saveAll(addresses);
  }
  
that doesn't have an exposure, but instead a derviation path... 

  DomainAddress deriveAddress(
    DomainWallet wallet,
    int hdIndex, ) {
    var subwallet = getSubWallet(wallet, hdIndex, exposure);
    return Address(
        id: subwallet.scripthash,
        address: subwallet.address!,
        walletId: wallet.id,
        hdIndex: hdIndex,
        exposure: exposure,
        net: datamodel.settings.net);
  }

  SeedWallet getSeedWallet(LeaderWallet wallet) {
    return SeedWallet(wallet.seed, datamodel.settings.net);
  }

  HDWallet getSubWallet(
    LeaderWallet wallet,
    int hdIndex,
    NodeExposure exposure,
  ) =>
      getSeedWallet(wallet).subwallet(hdIndex, exposure: exposure);

  HDWallet getSubWalletFromAddress(Address address) =>
      getSeedWallet(address.wallet as LeaderWallet)
          .subwallet(address.hdIndex, exposure: address.exposure);

  /// returns the next internal or external node missing a history
  String getNextEmptyAddress(
    LeaderWallet leaderWallet, {
    NodeExposure exposure = NodeExposure.Internal,
    bool random = false,
  }) {
    return random
        ? leaderWallet.getRandomUnusedAddress(exposure)!.address
        : leaderWallet.getUnusedAddress(exposure)!.address;
  }

  /// returns the next change address
  String getNextChangeAddress(LeaderWallet leaderWallet) {
    return getNextEmptyAddress(leaderWallet, exposure: NodeExposure.Internal);
  }

  HDWallet getNextEmptyWallet(
    LeaderWallet leaderWallet, {
    NodeExposure exposure = NodeExposure.Internal,
  }) {
    var seedWallet = getSeedWallet(leaderWallet);
    var i = 0;
    while (true) {
      var hdWallet = seedWallet.subwallet(i, exposure: exposure);
      if (datamodel.vouts.byAddress.getAll(hdWallet.address!).isEmpty) {
        return hdWallet;
      }
      i++;
    }
  }

  LeaderWallet? makeLeaderWallet(
    CipherBase cipher, {
    required CipherUpdate cipherUpdate,
    String? entropy,
    bool alwaysReturn = false,
    String? name,
  }) {
    entropy = entropy ?? bip39.mnemonicToEntropy(bip39.generateMnemonic());
    final mnemonic = bip39.entropyToMnemonic(entropy);
    final seed = bip39.mnemonicToSeed(mnemonic);
    final newId = HDWallet.fromSeed(seed).pubKey;
    final encrypted_entropy = hex.encrypt(entropy, cipher);

    var existingWallet = datamodel.wallets.primaryIndex.getOne(newId);
    if (existingWallet == null) {
      return LeaderWallet(
          id: newId,
          encryptedEntropy: encrypted_entropy,
          cipherUpdate: cipherUpdate,
          name: name ?? datamodel.wallets.nextWalletName);
    }
    if (alwaysReturn) return existingWallet as LeaderWallet;
    return null;
  }

  void makeFirstWallet(Cipher currentCipher) {
    if (datamodel.wallets.isEmpty) {
      makeSaveLeaderWallet(
        currentCipher.cipher,
        cipherUpdate: currentCipher.cipherUpdate,
      );
    }
  }

  Future<void> makeSaveLeaderWallet(
    CipherBase cipher, {
    required CipherUpdate cipherUpdate,
    String? mnemonic,
    String? name,
  }) async {
    var leaderWallet = makeLeaderWallet(
      cipher,
      cipherUpdate: cipherUpdate,
      entropy: mnemonic != null ? bip39.mnemonicToEntropy(mnemonic) : null,
      name: name,
    );
    if (leaderWallet != null) {
      await datamodel.wallets.save(leaderWallet);
    }
  }

  /// this function is used to determine if we need to derive new addresses
  /// based upon the idea that we want to retain a gap of empty histories
  Future<Set<Address>> deriveNextAddresses(
    LeaderWallet leaderWallet,
    CipherBase cipher,
    NodeExposure exposure,
  ) async {
    // get current gap from cache.
    var generate =
        requiredGap - registry.getIndexOf(leaderWallet, exposure).currentGap;
    //print('Want to generate $generate for $exposure');
    var target = 0;
    target = registry.getIndexOf(leaderWallet, exposure).saved + generate;
    if (generate > 0) {
      var futures = <Future<Address>>[
        for (var i = target - generate + 1; i <= target; i++)
          () async {
            return deriveAddress(leaderWallet, i, exposure: exposure);
          }()
      ];
      var ret = (await Future.wait(futures)).toSet();
      //print(ret);
      return ret;
    }
    return {};
  }

  HDWallet getChangeWallet(LeaderWallet wallet) => getNextEmptyWallet(wallet);

  /// deriveMoreAddresses also updates the cache we keep of highest saved
  /// addresses for each wallet-exposure. It does so after addresses are
  /// actually saved. the reason for this is that if we update the count to
  /// be higher than the number of addresses actually saved, we'll enter an
  /// infinite loop.
  Future<void> deriveMoreAddresses(
    LeaderWallet wallet, {
    List<NodeExposure>? exposures,
  }) async {
    exposures = exposures ?? [NodeExposure.External, NodeExposure.Internal];
    var newAddresses = <Address>{};
    for (var exposure in exposures) {
      var derivedAddresses = await deriveNextAddresses(
        wallet,
        datamodel.ciphers.primaryIndex.getOne(wallet.cipherUpdate)!.cipher,
        exposure,
      );
      newAddresses.addAll(derivedAddresses);
      registry.updateIndexOf(wallet, exposure,
          savedPlus: derivedAddresses.length);
    }
    await datamodel.addresses.saveAll(newAddresses);
    for (final address in newAddresses) {
      await services.client.subscribe.toAddress(address);
    }
  }
}

class LeaderExposureKey with EquatableMixin {
  LeaderWallet leader;
  NodeExposure exposure;

  LeaderExposureKey(this.leader, this.exposure);

  String get key => produceKey(leader.id, exposure);
  static String produceKey(String walletId, NodeExposure exposure) =>
      walletId + exposure.enumString;

  @override
  List<Object> get props => [leader, exposure];

  @override
  String toString() => 'LeaderExposureKey($leader, $exposure)';
}

class LeaderExposureIndex {
  int saved = 0;
  int used = 0;

  LeaderExposureIndex({this.saved = -1, this.used = -1});

  int get currentGap => saved - used;

  void updateSaved(int value) => saved = value > saved ? value : saved;
  void updateUsed(int value) => used = value > used ? value : used;
  void updateSavedPlus(int value) => saved = saved + value;
  void updateUsedPlus(int value) => used = used + value;
}

/// this is used to allow us to see how many addresses need to be derived.
class HDIndexRegistry {
  Map<LeaderExposureKey, LeaderExposureIndex> indexRegistry = {};

  /// caching optimization
  LeaderExposureIndex getIndexOf(LeaderWallet leader, NodeExposure exposure) {
    var key = LeaderExposureKey(leader, exposure);
    if (!indexRegistry.keys.contains(key)) {
      indexRegistry[key] = LeaderExposureIndex();
    }
    return indexRegistry[key]!;
  }

  LeaderExposureIndex getIndexOfKey(
      LeaderWallet leader, NodeExposure exposure) {
    var key = LeaderExposureKey(leader, exposure);
    if (!indexRegistry.keys.contains(key)) {
      indexRegistry[key] = LeaderExposureIndex();
    }
    return indexRegistry[key]!;
  }

  void updateIndexOf(
    LeaderWallet leader,
    NodeExposure exposure, {
    int? saved,
    int? used,
    int? savedPlus,
    int? usedPlus,
  }) {
    var key = LeaderExposureKey(leader, exposure);
    if (!indexRegistry.keys.contains(key)) {
      indexRegistry[key] = LeaderExposureIndex();
    }
    if (saved != null) {
      indexRegistry[key]!.updateSaved(saved);
    }
    if (used != null) {
      indexRegistry[key]!.updateUsed(used);
    }
    if (savedPlus != null) {
      indexRegistry[key]!.updateSavedPlus(savedPlus);
    }
    if (usedPlus != null) {
      indexRegistry[key]!.updateUsedPlus(usedPlus);
    }
  }

  /// this function allows us to avoid creating a 'hdindex' proclaim,
  /// which is nice.
  void updateIndex(LeaderWallet leader) {
    for (var exposure in [NodeExposure.External, NodeExposure.Internal]) {
      var addresses =
          datamodel.addresses.byWalletExposure.getAll(leader.id, exposure);
      updateIndexOf(
        leader,
        exposure,
        saved: addresses.map((a) => a.hdIndex).max,
        used: addresses
            .where((a) => a.vouts.isNotEmpty)
            .map((a) => a.hdIndex)
            .max,
      );
    }
  }
*/
}
