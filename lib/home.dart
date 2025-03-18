import 'package:cabbon/home_page.dart';
import 'package:cabbon/payments_page.dart';
import 'package:cabbon/service_page.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionBadgeWidget.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  final ValueNotifier<String> _appBarTitle = ValueNotifier<String>("Home");

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );

    // Listen to tab index changes
    _motionTabBarController!.addListener(() {
      _updateAppBarTitle(_motionTabBarController!.index);
    });
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    _appBarTitle.dispose();
    super.dispose();
  }

  void _updateAppBarTitle(int index) {
    switch (index) {
      case 0:
        _appBarTitle.value = "Home";
        break;
      case 1:
        _appBarTitle.value = "Service";
        break;
      case 2:
        _appBarTitle.value = "Payments";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: const Color.fromARGB(255, 0, 0, 0),
        title: ValueListenableBuilder<String>(
          valueListenable: _appBarTitle,
          builder: (context, title, _) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(title),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_2),
            iconSize: 30,
            color: const Color.fromARGB(255, 0, 0, 0),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            iconSize: 30,
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Home",
        labels: const ["Home", "Service", "Payments"],
        icons: const [Icons.home, Icons.room_service, Icons.payment],
        tabSize: 50,
        tabBarHeight: 55,
        tabSelectedColor: const Color.fromARGB(255, 0, 0, 0),
        tabIconColor: const Color.fromARGB(255, 0, 0, 0),
        tabIconSelectedColor: Colors.white,
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        tabBarColor: Colors.white,
        onTabItemSelected: (int value) {
          setState(() {
            _motionTabBarController!.index = value;
          });
        },
      ),
      body: TabBarView(
        controller: _motionTabBarController,
        children: [
         HomePage(),
          ServicePage(),
          PaymentsPage()
        ],
      ),
    );
  }
}


