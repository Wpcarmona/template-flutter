import 'package:app_template/presentation/views/views.dart';
import 'package:app_template/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int currentTab = 0;

  final List<Widget> screens = const [
    HomeView(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScreen = const HomeView();
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: HeaderWidget(scaffoldKey: scaffoldKey),
      key: scaffoldKey,
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      body: PageStorage(
        bucket: bucket, 
        child: currentScreen),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: Color(0xFFF6F6F6),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomBarItem(
              icon: Icons.home,
              label: 'Inicio',
              index: 0,
              onTap: (){
                setState(() {
                  currentTab = 0;
                  currentScreen = const HomeView();
                });
              }
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarItem({
    required IconData icon,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: currentTab == index ? Color(0xFFD4A448) : Color(0xFFC6C6C6),
          ),
          const SizedBox(height: 4), 
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: currentTab == index ? Color(0xFFD4A448) : Color(0xFFC6C6C6),
            ),
          ),
        ],
      ),
    );
  }
}