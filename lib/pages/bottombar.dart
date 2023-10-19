import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greetingbirthdayforyou/component/listwarna.dart';
import 'package:greetingbirthdayforyou/pages/about.dart';
import 'package:greetingbirthdayforyou/pages/newdashboard.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomBar extends StatefulWidget {
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  PersistentTabController? _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [DashboardNew(), Aboutme()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.grid_view_outlined),
        title: ("Dashboard"),
        activeColorPrimary: CupertinoColors.systemPink,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.cake_rounded),
        title: ("Tentang"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove("getDurasi");
        return true;
      },
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(20.0),
            colorBehindNavBar: ListWarna.biruBackground,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style1, // Choose the nav bar style with this property.
        ),
      ),
    );
  }
}
