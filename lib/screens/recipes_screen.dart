import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/recipes_widget.dart';

class RecipesScreen extends StatelessWidget {
  static const String id = 'RECIPES_PAGE';
  final List<Meal> meals;

  RecipesScreen({this.meals});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = arguments['title'];
    final String categoryId = arguments['id'];
    final categoryMeals = meals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return RecipesWidget(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
