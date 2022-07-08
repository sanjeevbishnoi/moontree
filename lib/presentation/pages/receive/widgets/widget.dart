import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moontree_layer_flutter/application/wallet/cubit.dart';

class WalletReceiveWidget extends StatelessWidget {
  const WalletReceiveWidget({Key? key}) : super(key: key);

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
        return Text(cubit.getReceiveAddress());
      },
    );
  }
}
