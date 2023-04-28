import 'package:flutter/material.dart';
import 'package:mealapp/screens/favorites.dart';
import 'package:mealapp/screens/home_screen.dart';

class TabsScreen extends StatefulWidget {
  static const String id = 'TABS_PAGE';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List _pages = [
    HomePage(),
    FavoritesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedPageIndex,
        selectedItemColor: Colors.deepOrangeAccent.withOpacity(.8),
        unselectedItemColor: Colors.grey.withOpacity(.8),
        type: BottomNavigationBarType.shifting,
        onTap: (index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favorites'),
        ],
      ),
    );
  }
}
