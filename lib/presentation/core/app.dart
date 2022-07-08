import 'package:flutter/material.dart';
import 'package:moontree/presentation/theme/custom.dart';
//import 'package:moontree/presentation/pages/wallet/page.dart';
//import 'package:moontree/presentation/pages/holding/page.dart';
//import 'package:moontree/presentation/pages/transaction/page.dart';
import 'package:moontree/presentation/pages/send/page.dart';
//import 'package:moontree/presentation/pages/address/page.dart';
//import 'package:moontree/presentation/pages/receive/page.dart';
//import 'package:moontree/presentation/pages/blockchain/page.dart';

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
