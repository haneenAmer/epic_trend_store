import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shahadmartapplication/constants/app_colors.dart';
import 'package:shahadmartapplication/constants/font_sizes.dart';
import 'package:shahadmartapplication/screens/categories.dart';
import 'package:shahadmartapplication/screens/home_screen.dart';
import 'package:shahadmartapplication/screens/settings_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    CategoriesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.mainWhite,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            // rippleColor: Color(0xff18D3AB)!,
            //hoverColor: AppColors.mainBlack,
            gap: 8,
            //activeColor: AppColors.mainBlack,
            iconSize: 24,
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 400),
            tabBackgroundColor: AppColors.mainWhite,
            color: AppColors.mainBlack,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'الرأيسية',
                textStyle: smallTextStyle(Colors.black),
              ),
              GButton(
                icon: Icons.category,
                text: 'الاقسام',
                textStyle: smallTextStyle(Colors.black),
              ),
              GButton(
                icon: Icons.settings,
                text: 'الاعدادات',
                textStyle: smallTextStyle(Colors.black),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
