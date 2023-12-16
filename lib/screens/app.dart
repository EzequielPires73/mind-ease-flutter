import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:new_app/screens/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/screens/profile.dart';
import 'package:new_app/screens/progress.dart';
import 'package:new_app/utils/colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int selectedIndex = 1;
  static const List<Widget> widgetOptions = <Widget>[
    Progress(),
    Home(),
    Profile(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            selectedIndex = 1;
          });
        },
        backgroundColor: ColorPalette.primary,
        child: const Icon(
          FeatherIcons.home,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(  
        height: 72,
        color: Colors.white,
        shadowColor: Colors.black54,
        surfaceTintColor: Colors.white,
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      selectedIndex == 0
                          ? 'assets/icons/evolution-active.svg'
                          : 'assets/icons/evolution.svg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Evolução',
                      style: TextStyle(
                          color: selectedIndex == 0
                              ? ColorPalette.primary
                              : ColorPalette.icon_inative,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: selectedIndex == 1
                              ? ColorPalette.primary
                              : ColorPalette.icon_inative,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      selectedIndex == 2
                          ? 'assets/icons/profile-active.svg'
                          : 'assets/icons/profile.svg',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Perfil',
                      style: TextStyle(
                          color: selectedIndex == 2
                              ? ColorPalette.primary
                              : ColorPalette.icon_inative,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}