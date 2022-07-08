// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:moontree_layer_flutter/domain/wallet/irepository.dart';
import 'package:moontree_layer_flutter/injection.dart';

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
    expect(
        x.fold(
          (l) => null,
          (r) => r.holdings[1].amount.value.fold(
            (l) => null,
            (r) => r,
          ),
        ),
        500.0);
    expect(
        x.fold(
          (l) => null,
          (r) => r.holdings[2].amount.value.fold(
            (l) => null,
            (r) => r,
          ),
        ),
        10.0);

    // shorthand
    // Either<WalletFailure, Wallet> x
    expect(
        x.fold(
          (l) => null,
          (r) => r.holdings[0].amount.get(),
        ),
        0.0);
    expect(
        x.fold(
          (l) => null,
          (r) => r.holdings[1].amount.get(),
        ),
        500.0);
    expect(
        x.fold(
          (l) => null,
          (r) => r.holdings[2].amount.get(),
        ),
        10.0);
    /*
    print(await _holdingsRepository.getWallet());
    Right(Wallet(holdings: [
      Holding(
        id: id,
        quantity: 
          Value(
            Left(
              ValueFailure<Tuple2<Amount, Decimal>>.invalidQuantity(
                amountDecimal: (
                  Value(Right(0.0)),
                  Value(Right(0)
                ))))),
        technicalName: technicalName, 
        name: name),
      Holding(
        id: whatever,
        quantity: Value(Right((Value(Right(5000.0)), Value(Right(8))))),
        technicalName: RVN,
        name: Ravencoin),
      Holding(
        id: whatever,
        quantity: Value(Right((Value(Right(1.0)), Value(Right(2))))), 
        technicalName: MOONTREE,
        name: Moontree)]))
    */
  });
}
