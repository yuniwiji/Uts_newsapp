import 'package:flutter/material.dart';
import 'package:news_app/pages/home_pages.dart';
import 'package:news_app/pages/profile_pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    Container(),
    Container(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color selectedColor = const Color(0XFFF33E3A);
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        backgroundColor: selectedColor,
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic/home.png',
              color: _selectedIndex == 0
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic/explorer.png',
              color: _selectedIndex == 1
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic/save.png',
              color: _selectedIndex == 2
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/ic/profile.png',
              color: _selectedIndex == 1
                  ? Colors.white
                  : Colors.white.withOpacity(0.5),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        onTap: _onItemTapped,
      ),
    );
  }
}
