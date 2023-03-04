import 'package:flutter/material.dart';
import 'package:nuserver/constants/gaps.dart';
import 'package:nuserver/constants/sizes.dart';
import 'package:nuserver/features/tracking_screen.dart';
import 'package:nuserver/services/widgets/nav_tab.dart';

class MainNavigationScreen extends StatefulWidget {
  static const routeName = '/mainNavigation';
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final screens = [
    const Center(
      child: Text(
        "Nutrione",
        style: TextStyle(
          fontSize: Sizes.size32,
        ),
      ),
    ),
    const Center(
      child: Text(
        "Mypuzzle",
        style: TextStyle(
          fontSize: Sizes.size32,
        ),
      ),
    ),
    const Center(
      child: Text(
        "Mdspick",
        style: TextStyle(
          fontSize: Sizes.size32,
        ),
      ),
    ),
    const Center(
      child: Text(
        "etc",
        style: TextStyle(
          fontSize: Sizes.size32,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex == 0 ? false : true,
            child: TrackingScreen(),
          ),
          Offstage(
            offstage: _selectedIndex == 1 ? false : true,
            child: screens[_selectedIndex],
          ),
          Offstage(
            offstage: _selectedIndex == 2 ? false : true,
            child: screens[_selectedIndex],
          ),
          Offstage(
            offstage: _selectedIndex == 3 ? false : true,
            child: screens[_selectedIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavTab(
              title: "Nutrione",
              onTap: () => _onTap(0),
              isSelected: _selectedIndex == 0,
            ),
            Gaps.h5,
            NavTab(
              title: "Mypuzzle",
              onTap: () => _onTap(1),
              isSelected: _selectedIndex == 1,
            ),
            Gaps.h5,
            NavTab(
              title: "Mdspick",
              onTap: () => _onTap(2),
              isSelected: _selectedIndex == 2,
            ),
            Gaps.h5,
            NavTab(
              title: "etc",
              onTap: () => _onTap(3),
              isSelected: _selectedIndex == 3,
            ),
          ],
        ),
      ),
    );
  }
}
