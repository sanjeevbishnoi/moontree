import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moontree/presentation/backdrop/curve.dart';
import 'package:moontree/presentation/components/shapes.dart' as shapes;
import 'package:moontree/presentation/components/colors.dart' as colors;

class BackdropAppBarContents extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool spoof;
  final bool animate;

  const BackdropAppBarContents(
      {Key? key, this.title = 'Title', this.spoof = false, this.animate = true})
      : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  @override
  Widget build(BuildContext context) {
    final appBar = Platform.isIOS
        ? buildAppBar(
            context,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark, // For iOS
            ),
            backgroundColor: Colors.transparent,
            shape: shapes.topRounded8,
          )
        : buildAppBar(
            context,
            backgroundColor: colors.primary,
            shape: shapes.topRounded8,
          );
    /*final alphaBar = Platform.isIOS
        ? Container(
            height: 56,
            child: ClipRect(
              child: Container(
                alignment: Alignment.topRight,
                child: Banner(
                  message: 'alpha',
                  location: BannerLocation.topEnd,
                  color: AppColors.success,
                ),
              ),
            ))
        : ClipRect(
            child: Container(
              alignment: Alignment.topRight,
              child: Banner(
                message: 'alpha',
                location: BannerLocation.topEnd,
                color: AppColors.success,
              ),
            ),
          );*/
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        if (Platform.isIOS)
          FrontCurve(
            height: 56,
            color: Theme.of(context).backgroundColor,
            fuzzyTop: false,
            frontLayerBoxShadow: const [],
          ),
        testAppBar(appBar, test: false),
      ],
    );
  }

  Widget testAppBar(Widget appBar, {bool test = false}) => test
      ? GestureDetector(
          onTap: () async {},
          child: appBar,
        )
      : appBar;

  Widget buildAppBar(
    BuildContext context, {
    SystemUiOverlayStyle? systemOverlayStyle,
    Color? backgroundColor,
    ShapeBorder? shape,
  }) =>
      AppBar(
        systemOverlayStyle: systemOverlayStyle,
        backgroundColor: backgroundColor,
        shape: shape,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: null,
        centerTitle: spoof,
        title: Text(title),
        actions: const <Widget>[],
      );
}
