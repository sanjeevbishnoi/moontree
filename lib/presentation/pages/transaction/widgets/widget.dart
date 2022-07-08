import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moontree_layer_flutter/application/transaction/cubit.dart';

class TransactionDetailWidget extends StatelessWidget {
  const TransactionDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionCubitState>(
      bloc: BlocProvider.of<TransactionCubit>(context)..enter(),
      builder: (context, state) {
        final cubit = BlocProvider.of<TransactionCubit>(context);
        if (state.isSubmitting) {
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('amount'),
                Text(cubit.getAmount()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDateType'),
                Text(
                  cubit.getDateType(),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('isReceived'),
                cubit.isReceived()
                    ? const Icon(Icons.north_east)
                    : const Icon(Icons.south_west),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getConfirmations'),
                Text(cubit.getConfirmations()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDate'),
                Text(cubit.getDate()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDateType'),
                Text(cubit.getDateType()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getTxId'),
                Text(cubit.getTxId()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getType'),
                Text(cubit.getType()),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailAmount'),
                Text(cubit.getDetailAmount()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailAssetType'),
                Text(cubit.getDetailAssetType()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailConfirmations'),
                Text(cubit.getDetailConfirmations()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailDate'),
                Text(cubit.getDetailDate()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailFullName'),
                Text(cubit.getDetailFullName()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailName'),
                Text(cubit.getDetailName()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailIpfsHash'),
                Text(cubit.getDetailIpfsHash()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailMemo'),
                Text(cubit.getDetailMemo()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailNote'),
                Text(cubit.getDetailNote()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailOtherFees'),
                Text(cubit.getDetailFees().toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailTransactionFee'),
                Text(cubit.getDetailTransactionFee()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailTxId'),
                Text(cubit.getDetailTxId()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('getDetailType'),
                Text(cubit.getDetailType()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('isDetailReceived'),
                cubit.isDetailReceived()
                    ? const Icon(Icons.north_east)
                    : const Icon(Icons.south_west),
              ],
            ),
          ],
        );
      },
    );
  }
}
