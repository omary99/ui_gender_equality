import 'package:flutter/material.dart';
import 'package:gender_equality/screens/pages/drawer_page.dart';
import 'package:gender_equality/screens/screens/blog/blog_screen.dart';
import 'package:gender_equality/screens/screens/education_screen.dart';
import 'package:gender_equality/screens/screens/report_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  List<Widget> _screens = [
    BlogScreen(),
    EducationScreen(),
    ReportScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[50],
      drawer: Drawer(child: DrawerPage()),
      appBar: AppBar(
        title: Text('Gender Equality'),
      ),
      body: _screens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'blog',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'education'),
          BottomNavigationBarItem(icon: Icon(Icons.add_task), label: 'report'),
        ],
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
