import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moontree/application/address/cubit.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressCubitState>(
      bloc: BlocProvider.of<AddressCubit>(context)..enter(),
      builder: (context, state) {
        final cubit = BlocProvider.of<AddressCubit>(context);
        if (state.isSubmitting) {
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        }
        return Column(
          children: [
            Text(cubit.getAddress()),
            Text(cubit.getPrivateKey()),
            Text(cubit.getPublicKey()),
            Text(cubit.getDerivationPath()),
            Text(cubit.isMainnet() ? 'Mainnet' : 'not Mainnet'),
            Text(cubit.isReceive() ? 'Receive' : 'not Receive'),
            Text(cubit.isRavencoin() ? 'Ravencoin' : 'not Ravencoin'),
            Text('${cubit.getDerivationIndex()} + index'),
          ],
        );
      },
    );
  }
}
