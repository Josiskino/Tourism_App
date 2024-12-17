import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/features/home_page/presentation/pages/main_screen.dart';
import 'package:myapp/main_screen/settings_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
   CustomBottomNavBar({super.key});

  List<Widget> _buildScreens() {
        return [
          MainScreen(),
          const SettingsScreen()
        ];
    }

    final ScrollController _scrollController2 = ScrollController();

    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
                scrollController: _scrollController2,
                // routeAndNavigatorSettings: RouteAndNavigatorSettings(
                //     initialRoute: "/",
                //     routes: {
                //     "/first": (final context) =>  MainScreen(),
                //     "/second": (final context) => const SettingsScreen(),
                //     },
                // ),
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.settings),
                title: ("Settings"),
                activeColorPrimary: CupertinoColors.activeBlue,
                inactiveColorPrimary: CupertinoColors.systemGrey,
                scrollController: _scrollController2,
                // routeAndNavigatorSettings: RouteAndNavigatorSettings(
                //     initialRoute: "/",
                //     routes: {
                //     "/first": (final context) =>  MainScreen(),
                //     "/second": (final context) => const SettingsScreen(),
                //     },
                // ),
            ),
        ];
    }

    

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

_controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        //popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
        padding: const EdgeInsets.only(top: 8),
        backgroundColor: Colors.grey.shade900,
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                duration: Duration(milliseconds: 200),
                screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
            ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
        //navBarStyle: _navBarStyle, // Choose the nav bar style with this property
    );
  }
}