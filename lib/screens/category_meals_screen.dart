import 'package:flutter/material.dart';

import '../widgets/meals_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  List<dynamic> availableMeals;

  CategoryMealsScreen({required this.availableMeals});

  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final routeId = routeArgs['id'];
    final routeTitle = routeArgs['title'];
    final categoryMeals = availableMeals.where((element) {
      return element.categories.contains(routeId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeTitle!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageURL,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
