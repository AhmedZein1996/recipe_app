import 'package:flutter/material.dart';
import 'package:mealapp/utilities/categories_meals_list.dart';
import 'package:mealapp/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  static const String id = 'HOME_PAGE';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal'),
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: DrawerWidget(),
      body: SafeArea(
          child: GridView(
        padding: EdgeInsets.all(20),
        children: CATEGORIES,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      )),
    );
  }
}
