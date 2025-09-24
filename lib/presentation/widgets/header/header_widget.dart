import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HeaderWidget({super.key, required this.scaffoldKey});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {
        scaffoldKey.currentState?.openDrawer();
      }, icon: const Icon(Icons.menu)),
      title: const Text('App Template'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.notifications_none_rounded),
          onPressed: () {
            context.push('/notifications');
          },
        ),
      ],
    );
  }
}
