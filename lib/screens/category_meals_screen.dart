import 'package:flutter/material.dart';
import 'package:recipes/data/dummy_data.dart';
import 'package:recipes/widgets/meals_item.dart';

class CategoryMealsScreen extends StatelessWidget {
/*   final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen({
    required this.categoryId,
    required this.categoryTitle,
  }); */

  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final routeId = routeArgs['id'];
    final routeTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS.where((element) {
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
