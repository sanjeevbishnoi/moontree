import 'package:moontree/domain/unspent/entity.dart';
import 'package:moontree/utils/extensions/list.dart';
import 'package:ravencoin_wallet/ravencoin_wallet.dart' as ravencoin;

extension SignEachInput on ravencoin.TransactionBuilder {
  /// Since addresses don't have access to their private key for signing, we
  /// need to find the keypair for each type of wallet and use it to sign the
  /// inputs. input order of the created transaction.
  Future<void> signEachInput(List<Unspent> unspents) async {
    for (var e in unspents.enumerated()) {
      //int i = e[0];
      //Unspent unspent = e[1];
      // TODO: convert this logic over to new v2 structure...
      //var keyPair = services.wallet.getAddressKeypair(unspent.address!);
      //sign(
      //  vin: i,
      //  keyPair: keyPair,
      //  prevOutScriptOverride: unspent.isAsset
      //      ? (unspent.lockingScript == null
      //              ? (await services.client.api
      //                      .getTransaction(unspent.transactionId))
      //                  .vout[unspent.position]
      //                  .scriptPubKey
      //                  .hex
      //              : unspent.lockingScript)
      //          .hexBytes
      //      : null,
      //);
    }
  }
}
