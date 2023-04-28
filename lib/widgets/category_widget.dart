import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/screens/recipes_screen.dart';

class CategoryWidget extends StatelessWidget {
  final String id;
  final String title;

  const CategoryWidget({this.title, this.id});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(RecipesScreen.id, arguments: {
      'title': title,
      'id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      shape: BoxShape.circle,
      borderRadius: BorderRadius.circular(10),
      color: Colors.redAccent,
      elevation: 15,
      child: GestureDetector(
        onTap: () => selectCategory(context),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.redAccent,
                Colors.orange.withOpacity(.8),
              ],
//              begin: Alignment.topLeft,
//              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
