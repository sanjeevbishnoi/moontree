import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moontree_layer_flutter/application/send/cubit.dart';
import 'package:moontree_layer_flutter/injection.dart';
import 'package:moontree_layer_flutter/presentation/back/back.dart';
import 'package:moontree_layer_flutter/presentation/backdrop/backdrop.dart';
import 'package:moontree_layer_flutter/presentation/pages/send/widgets/widget.dart';

class SendPage extends StatelessWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackdropAppBar(title: 'Send'),
      body: BackdropLayers(
        frontAlignment: Alignment.center,
        back: const BlankBack(),
        front: Stack(
          children: [
            FrontCurve(
              alignment: Alignment.topCenter,
              fuzzyTop: true,
              child: BlocProvider(
                create: (context) => getIt<SendCubit>(),
                child: const SendWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
