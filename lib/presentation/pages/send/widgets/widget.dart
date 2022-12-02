import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moontree_utils/moontree_utils.dart' show range;
import 'package:moontree/application/send/cubit.dart';
import 'package:moontree/domain/core/common/values.dart';
import 'package:moontree/domain/holding/values.dart';
import 'package:moontree/domain/send/values.dart';
import 'package:moontree/infrastructure/holding/dev_repository.dart';
import 'package:moontree/infrastructure/unspent/dev_repository.dart';

class SendWidget extends StatelessWidget {
  const SendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendCubit, SendCubitState>(
      bloc: BlocProvider.of<SendCubit>(context)..enter(),
      builder: (context, state) {
        final cubit = BlocProvider.of<SendCubit>(context);
        if (state.isSubmitting) {
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }
        return Column(
          children: <Widget>[
            Text(cubit.getHoldingFullName()),
            Text(cubit.getHoldingName()),
            Text(cubit.getHoldingAssetType()),
            Text(cubit.getHoldingAmount().toString()),
            Text(cubit.getAmount().toString()),
            Text(cubit.getToAddress()),
            Text(cubit.getChangeAddress()),
            Text(cubit.getFeeSelection()),
            Text(cubit.getMemo()),
            Text(cubit.getNote()),
            ...[
              for (var i in range(cubit.getUnspentCount())) ...[
                Text(cubit.getUnspentLockingScript(i)),
                Text(cubit.getUnspentTo(i)),
                Text(cubit.getUnspentTxId(i)),
                Text('${cubit.getUnspentAmount(i)}'),
                Text('${cubit.getUnspentPosition(i)}'),
              ]
            ],
            TextButton(
                onPressed: () async => cubit.choose(await HoldingRepository()
                    .getHolding()
                    .then((value) => value.fold(
                        (l) => throw Exception(
                            'dev send repository unable to get holding'),
                        (r) => r))),
                child: Text('set holding')),
            TextButton(
                onPressed: () => cubit.choose(state.send.fold(
                    (l) => throw Exception('again?'),
                    (r) => r.holding.copyWith(name: Name('TESTCHANGE')))),
                child: Text('set holding again')),
            TextButton(
                onPressed: () => cubit.choose(Amount(21)),
                child: Text('set amount')),
            TextButton(
                onPressed: () => cubit.choose(FeeSelection.fast),
                child: Text('set fee selection')),
            TextButton(
                onPressed: () => cubit.choose(PubKeyAddress(
                    'mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g',
                    mainnet: false)),
                child: Text('set to address')),
            TextButton(
                onPressed: () => cubit.choose(Memo('memo string')),
                child: Text('set Memo')),
            TextButton(
                onPressed: () => cubit.choose(Note('memo is not ipfs')),
                child: Text('set Note')),

            /// happens after you set the holding
            TextButton(
                onPressed: () async => cubit.submitRavenUnspents(
                    await UnspentRepository()
                        .getUnspents()
                        .then((value) => value.fold((l) => [], (r) => r))),
                child: Text('set unspents (from server)')),

            /// happens onload
            TextButton(
                onPressed: () async => cubit.submitChangeAddress(PubKeyAddress(
                    'mr5b2NJrHteveB127au8GgCqRuzF8ZNg4g',
                    mainnet: false)),
                child: Text('set change address (from server)')),

            /// submit
            TextButton(
                onPressed: () async => cubit.submit(), child: Text('submit')),
          ],
        );
      },
    );
  }
}
