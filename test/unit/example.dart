// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:moontree/domain/wallet/irepository.dart';
import 'package:moontree/injection.dart';

void main() {
  setUp(() {
    configureInjection(Env.test);
  });
  test('should do something', () async {
    final holdingsRepository = getIt<IWalletRepository>();
    final x = await holdingsRepository.getWallet();
    expect(
        x.fold(
          (l) => null,
          (r) => r.holdings[0].amount.value.fold(
            (l) => null,
            (r) => r,
          ),
        ),
        0.0);
  });
}
