import 'package:flutter/material.dart';
import 'package:furniture/screens/homescreen.dart';
import 'package:furniture/screens/categoriesscreen.dart';
import 'package:furniture/screens/favorites.dart';
import 'package:furniture/screens/profilescreen.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    CategoriesPage(),
    Favorites(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff2E7D32),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Image.asset('lib/icons/home.png',height:19,width:12), label: 'Home'),
          BottomNavigationBarItem(icon: Image.asset('lib/icons/category.png',height:19,width:12), label: 'Category'),
          BottomNavigationBarItem(icon: Image.asset('lib/icons/love.png',height:19,width:12), label: 'Favorites'),
          BottomNavigationBarItem(icon: Image.asset('lib/icons/prof.png',height:19,width:12), label: 'Profile'),
        
        ],
      ),
    );
  }
}