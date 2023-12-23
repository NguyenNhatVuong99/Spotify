// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mobile/pages/favorite_page/favorite_page.dart';
import 'package:mobile/pages/feature_page/feature_page.dart';
import 'package:mobile/pages/settings_page/settings_page.dart';
import 'package:mobile/pages/profile_page/profile_page.dart';
import 'package:mobile/themes/app_color.dart';
import 'package:mobile/configs/svg.dart';
import 'package:mobile/widgets/constain_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    featurePage(),
    settingsPage(),
    favoritePage(),
    profilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      // _selectedIndex = index;
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      extendBodyBehindAppBar: true,
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.primaryBackground,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSVG.home,
              color: _selectedIndex == 0
                  ? AppColor.primaryColor
                  : AppColor.secondaryColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSVG.discover,
              color: _selectedIndex == 1
                  ? AppColor.primaryColor
                  : AppColor.secondaryColor,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSVG.heart,
              color: _selectedIndex == 2
                  ? AppColor.primaryColor
                  : AppColor.secondaryColor,
            ),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSVG.profile,
              color: _selectedIndex == 3
                  ? AppColor.primaryColor
                  : AppColor.secondaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
