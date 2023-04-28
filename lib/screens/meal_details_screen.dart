import 'package:flutter/material.dart';
import 'package:mealapp/utilities/categories_meals_list.dart';

class MealScreen extends StatelessWidget {
  static const String id = 'MEAL_PAGE';
//  final String title;
//  final String image;
//  final List<String> ingredients;
//  final List<String> steps;
//
//  MealScreen({this.title, this.image, this.ingredients, this.steps});

  @override
  Widget build(BuildContext context) {
    final String selectedMealId =
        ModalRoute.of(context).settings.arguments as String;
    final meal = MEALS.firstWhere((meal) => meal.id == selectedMealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                height: 320,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              height: 450,
              width: 393,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Text(
                          meal.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.schedule,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('${meal.duration} min'),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.work_outline,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Simple'),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.attach_money,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Afforadable'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 10, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ingredients',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              meal.ingredients.toString(),
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Steps',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              meal.steps.toString(),
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
