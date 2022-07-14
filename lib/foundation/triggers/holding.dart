/// started this, then learned we had to change our model on the server for wallet and their derivations
// import 'package:moontree/domain/holding/values.dart';
// import 'package:moontree/foundation/data_model/records/asset.dart';
// import 'package:moontree/foundation/domain/records/holding.dart';
// import 'package:proclaim/change.dart';
// import 'package:utils/trigger.dart';
// import 'package:moontree/foundation/data_model/proclaim/proclaim.dart' as pros;
// import 'package:moontree/foundation/domain/proclaim/proclaim.dart'
//     as domain_pros;
// 
// // working example where tranlsation happens here.
// class AssetToDomain extends Trigger {
//   void init() {
//     when(
//       thereIsA: pros.balances.changes,
//       andIf: null,
//       doThis: (Change<Asset> change) async => change.when(
//           loaded: (loaded) {},
//           added: (added) {
//             // holdings are made up of assets and balances
//             // so we should already have the asset if we get a balance,
//             // and if not, we need an endpoint to be able to get it.
//             domain_pros.holdings.save(DomainHolding.fromAssetAndAmountAndTransactions(
//                 amount: domain_pros.assets.byFullNameAssetType.getOne(),
//                 transactions: [],
//                 domainAsset: 
//                 ));
//           },
//           updated: (updated) {},
//           removed: (removed) {}),
//     );
//   }
// }
// 