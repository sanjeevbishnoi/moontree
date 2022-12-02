import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moontree/application/address/cubit.dart';
import 'package:moontree/injection.dart';
import 'package:moontree/presentation/back/back.dart';
import 'package:moontree/presentation/backdrop/backdrop.dart';
import 'package:moontree/presentation/pages/address/widgets/widget.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackdropAppBar(title: 'Address'),
      body: BackdropLayers(
        frontAlignment: Alignment.center,
        back: const BlankBack(),
        front: Stack(
          children: <Widget>[
            FrontCurve(
              alignment: Alignment.topCenter,
              fuzzyTop: true,
              child: BlocProvider(
                create: (context) => getIt<AddressCubit>(),
                child: const AddressWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
