import 'package:flutter/material.dart';
import 'package:moontree_layer_flutter/presentation/theme/custom.dart';
//import 'package:moontree_layer_flutter/presentation/pages/wallet/page.dart';
//import 'package:moontree_layer_flutter/presentation/pages/holding/page.dart';
//import 'package:moontree_layer_flutter/presentation/pages/transaction/page.dart';
import 'package:moontree_layer_flutter/presentation/pages/send/page.dart';
//import 'package:moontree_layer_flutter/presentation/pages/address/page.dart';
//import 'package:moontree_layer_flutter/presentation/pages/receive/page.dart';
//import 'package:moontree_layer_flutter/presentation/pages/blockchain/page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const WalletHoldingsPage(),
      //home: const TransactionsPage(),
      home: const SendPage(),
      //home: const AddressPage(),
      //home: const WalletReceivePage(),
      //home: const BlockchainPage(),
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.lightTheme,
    );
  }
}
