import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moontree/application/wallet/cubit.dart';

class WalletHoldingsWidget extends StatelessWidget {
  const WalletHoldingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletCubitState>(
      bloc: BlocProvider.of<WalletCubit>(context)..enter(),
      builder: (context, state) {
        final cubit = BlocProvider.of<WalletCubit>(context);
        if (state.isSubmitting) {
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }
        return Stack(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: cubit.itemCount(),
              itemBuilder: (BuildContext context, int index) => ListTile(
                leading: const Icon(Icons.circle),
                title: Text(cubit.getName(index)),
                subtitle: Text(
                  cubit.getHoldingFullName(index),
                  style: Theme.of(context).textTheme.caption,
                ),
                trailing: Text(
                  cubit.getHoldingAmount(index),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
