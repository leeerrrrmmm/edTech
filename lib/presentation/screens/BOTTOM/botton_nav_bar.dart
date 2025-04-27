import 'package:course_ed_tech/presentation/screens/PROFILE/profile_screen.dart';
import 'package:course_ed_tech/presentation/screens/SETTINGS/settings_screen.dart';
import 'package:course_ed_tech/presentation/screens/MAIN/main_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<Widget> _pages = [MainScreen(), ProfileScreen(), SettingsScreen()];

  int _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xffe3562a),
        unselectedItemColor: Color(0xffbebab3),
        onTap: (val) {
          setState(() {
            _curIndex = val;
          });
        },
        currentIndex: _curIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
      body: _pages[_curIndex],
    );
  }
}
