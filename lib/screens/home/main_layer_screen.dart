import 'package:evently_app_6pm/common/theme/app_colors.dart';
import 'package:evently_app_6pm/gen/assets.gen.dart';
import 'package:evently_app_6pm/screens/home/fav_tab/fav_tab.dart';
import 'package:evently_app_6pm/screens/home/home_tab/home_tab.dart';
import 'package:evently_app_6pm/screens/home/settings_tab/settings_tab.dart';
import 'package:evently_app_6pm/screens/new_event/new_event_screen.dart';
import 'package:flutter/material.dart';

class MainLayerScreen extends StatefulWidget {
  const MainLayerScreen({super.key});
  static const routeName = '/main-layer';

  @override
  State<MainLayerScreen> createState() => _MainLayerScreenState();
}

class _MainLayerScreenState extends State<MainLayerScreen> {
  int currantIndent = 0;
  List<Widget> tabs = [HomeTab(), Container(), FavTab(), SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currantIndent],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightBgColors,
        ),
        child: FloatingActionButton(
          backgroundColor: Theme.of(
            context,
          ).bottomNavigationBarTheme.backgroundColor,
          onPressed: () {
            Navigator.of(context).pushNamed(NewEventScreen.routeName);
          },

          shape: CircleBorder(),
          child: Icon(Icons.add, color: AppColors.lightBgColors, size: 30),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // color: ,
        padding: EdgeInsets.zero,
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,

        child: BottomNavigationBar(
          onTap: (value) => setState(() {
            currantIndent = value;
          }),
          currentIndex: currantIndent,
          items: [
            BottomNavigationBarItem(
              icon: Assets.icons.homeIconUnselected.svg(),
              activeIcon: Assets.icons.homeIconSelected.svg(),
              label: 'Home', //TODO:localization
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.locationIconUnselected.svg(),
              activeIcon: Assets.icons.locationIconSelected.svg(),
              label: 'Location',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.favIconUnselected.svg(),
              activeIcon: Assets.icons.favIconSelected.svg(),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.profileIconUnselected.svg(),
              activeIcon: Assets.icons.profileIconSelected.svg(),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
