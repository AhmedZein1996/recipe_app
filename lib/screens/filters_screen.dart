import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/drawer_widget.dart';
import 'package:mealapp/utilities/categories_meals_list.dart';

class FilterScreen extends StatefulWidget {
  static const String id = 'FILTER_PAGE';
  final Function saveFilters;
  final Map<String, bool> filterState;

  FilterScreen({this.saveFilters, this.filterState});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGluten = false;
  bool isLactose = false;
  bool vegan = false;
  bool vegetarian = false;

  List<Meal> glutenFreeMeals = MEALS;

  @override
  void initState() {
    super.initState();
    isGluten = widget.filterState['isGluten'];
    isLactose = widget.filterState['isLactose'];
    vegan = widget.filterState['vegan'];
    vegetarian = widget.filterState['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    glutenFreeMeals = MEALS.where((meal) {
      if (isGluten == true && meal.isGlutenFree == false) {
        return false;
      }
      if (isLactose == true && meal.isLactoseFree == false) {
        return false;
      }
      if (vegan == true && meal.isVegan == false) {
        return false;
      }
      if (vegetarian == true && meal.isVegetarian == false) {
        return false;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            SwitchListTile(
                title: Text('Gluten-free'),
                activeColor: Colors.deepOrangeAccent,
                value:
                    isGluten, // ( if isGluten = true )this mean meals with gluten-free will be shown
                onChanged: (value) {
                  setState(() {
                    isGluten = value;
                  });
                }),
            SwitchListTile(
                title: Text('Lactose-free'),
                activeColor: Colors.deepOrangeAccent,
                value: isLactose,
                onChanged: (value) {
                  setState(() {
                    isLactose = value;
                  });
                }),
            SwitchListTile(
                title: Text('Vegan'),
                activeColor: Colors.deepOrangeAccent,
                value: vegan,
                onChanged: (value) {
                  setState(() {
                    vegan = value;
                  });
                }),
            SwitchListTile(
                title: Text('Vegetarian'),
                value: vegetarian,
                activeColor: Colors.deepOrangeAccent,
                onChanged: (value) {
                  setState(() {
                    vegetarian = value;
                  });
                }),
            SizedBox(
              height: 100,
            ),
            RaisedButton(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Apply Filters',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              color: Colors.orange,
              onPressed: () {
                final selectedFilter = {
                  'isGluten': isGluten,
                  'isLactose': isLactose,
                  'vegan': vegan,
                  'vegetarian': vegetarian,
                };
                widget.saveFilters(
                  glutenFreeMeals,
                  selectedFilter,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
