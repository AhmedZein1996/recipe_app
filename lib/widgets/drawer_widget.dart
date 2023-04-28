import 'package:flutter/material.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: Colors.orangeAccent,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(Icons.set_meal),
            title: Text('Meal'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.id);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Serrings'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.id);
            },
          )
        ],
      ),
    );
  }
}
