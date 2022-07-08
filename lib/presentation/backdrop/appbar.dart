import 'package:flutter/material.dart';
import 'package:moontree/presentation/backdrop/appbar_contents.dart';

class BackdropAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const BackdropAppBar({Key? key, this.title = 'Title'}) : super(key: key);

  @override
  State<BackdropAppBar> createState() => _BackdropAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}

class _BackdropAppBarState extends State<BackdropAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropAppBarContents(title: widget.title);
  }
}
