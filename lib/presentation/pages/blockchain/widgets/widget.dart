import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moontree_layer_flutter/application/blockchain/cubit.dart';

class BlockchainWidget extends StatelessWidget {
  const BlockchainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlockchainCubit, BlockchainCubitState>(
      bloc: BlocProvider.of<BlockchainCubit>(context)..enter(),
      builder: (context, state) {
        final cubit = BlocProvider.of<BlockchainCubit>(context);
        if (state.isSubmitting) {
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }
        return Column(
          children: [
            Text(cubit.getProtocol()),
            ...[for (var name in cubit.getWalletNames()) Text(name)],
          ],
        );
      },
    );
  }
}
