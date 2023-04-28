import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/meal_details_screen.dart';
import 'package:mealapp/screens/recipes_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';
import 'package:mealapp/utilities/categories_meals_list.dart';
import 'screens/recipes_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = MEALS;
  Map<String, bool> filtersState = {
    'isGluten': false,
    'isLactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  void filterCallBack(List<Meal> filterMeals, Map<String, bool> filterState) {
    setState(() {
      _availableMeals = filterMeals;
      filtersState = filterState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: TabsScreen.id,
      routes: {
        TabsScreen.id: (context) => TabsScreen(),
        HomePage.id: (context) => HomePage(),
        RecipesScreen.id: (context) => RecipesScreen(
              meals: _availableMeals,
            ),
        MealScreen.id: (context) => MealScreen(),
        FilterScreen.id: (context) => FilterScreen(
              saveFilters: filterCallBack,
              filterState: filtersState,
            ),
      },
    );
  }
}
