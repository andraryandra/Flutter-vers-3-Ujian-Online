import 'package:flutter/material.dart';
import 'package:flutter_first/screens/menu_tampilan/admin/home.dart';
import 'package:flutter_first/screens/menu_tampilan/admin/index.dart';
import 'package:flutter_first/screens/menu_tampilan/home.dart';
import 'package:flutter_first/screens/menu_tampilan/profile.dart';

class HomeBottomAdminScreen extends StatelessWidget {
  const HomeBottomAdminScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: NavbarBottomAdmin(),
    );
  }
}

class NavbarBottomAdmin extends StatefulWidget {
  const NavbarBottomAdmin({Key? key}) : super(key: key);

  @override
  State<NavbarBottomAdmin> createState() => _NavbarBottomAdminState();
}

class _NavbarBottomAdminState extends State<NavbarBottomAdmin> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeAdminScreen(),
    // Text(
    //   'Index 0: Home',
    //   style: optionStyle,
    // ),
    Text(
      'Index 1: Siswa',
      style: optionStyle,
    ),
    // HomeGuruScreen(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    ProfileScreen(),
    // Text(
    //   'Index 3: Settings',
    //   style: optionStyle,
    // ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: IconThemeData(
          color: Color.fromARGB(255, 69, 80, 105),
        ),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Siswa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 174, 255),
        onTap: _onItemTapped,
      ),
    );
  }
}
