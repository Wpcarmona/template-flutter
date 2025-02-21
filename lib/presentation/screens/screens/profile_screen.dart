

import 'package:app_template/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: HeaderWidget(scaffoldKey: scaffoldKey),
      key: scaffoldKey,
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}