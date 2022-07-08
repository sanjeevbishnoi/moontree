import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moontree/application/holding/cubit.dart';

class TransactionsWidget extends StatelessWidget {
  const TransactionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HoldingCubit, HoldingCubitState>(
      bloc: BlocProvider.of<HoldingCubit>(context)..enter(),
      builder: (context, state) {
        final cubit = BlocProvider.of<HoldingCubit>(context);
        if (state.isSubmitting) {
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }
        return Stack(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: cubit.itemCount(),
              itemBuilder: (BuildContext context, int index) => ListTile(
                leading: const Icon(Icons.circle),
                title: Text(cubit.getTxAmount(index)),
                subtitle: Text(
                  cubit.getDateType(index),
                  style: Theme.of(context).textTheme.caption,
                ),
                trailing: cubit.getReceived(index)
                    ? const Icon(Icons.north_east)
                    : const Icon(Icons.south_west),
              ),
            ),
          ],
        );
      },
    );
  }
}
