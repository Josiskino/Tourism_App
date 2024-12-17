import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/custom_bottom_navigationBar/custom_bottom_app_bar.dart';
//import 'package:myapp/main_screen/activities_screen.dart';
import 'package:myapp/main_screen/bloc/cubit/tab_cubit.dart';
import 'package:myapp/main_screen/favorites_screen.dart';
//import 'package:myapp/main_screen/home_screen.dart';
import 'package:myapp/main_screen/map_screen.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/main_screen/settings_screen.dart';
import 'package:myapp/features/home_page/presentation/pages/newhome/newhome.dart';


class MainScreen extends StatelessWidget {
  final List<Widget> screens = [
    const NewHome(),
    //HomeScreen(),
    //const ActivitiesScreen(),
     const FavoritesScreen(),
    const MapScreen(),
    const SettingsScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          int currentTab = 0;
          if (state is TabSelected) {
            currentTab = state.index;
          }

          return CustomBottomAppBar(
            unSelectedColor: Colors.grey.shade400,
            selectedColor: Theme.of(context).colorScheme.primary,
            onTap: (index) {
              context.read<TabCubit>().selectTab(index);
            },
            selectedTab: currentTab,
            children: const [
              CustomBottomAppBarItem(
                icon: Iconsax.home,
                text: "Home",
              ),
              CustomBottomAppBarItem(
                icon: Iconsax.activity,
                text: "Activities",
              ),
              CustomBottomAppBarItem(
                icon: Iconsax.map,
                text: "Map",
              ),
              CustomBottomAppBarItem(
                icon: Iconsax.setting,
                text: "Settings",
              ),
            ],
          );
        },
      ),
      body: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          int currentTab = 0;
          if (state is TabSelected) {
            currentTab = state.index;
          }
          return screens[currentTab];
        },
      ),
    );
  }
}
