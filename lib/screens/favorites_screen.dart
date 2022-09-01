import 'package:flutter/material.dart';

import '../widgets/meals_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const String routeName = '/favorites-screen';
  final List<dynamic> favoritesMeals;

  const FavoritesScreen({required this.favoritesMeals});

  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet! Start adding some. '),
      );
    } else {
      return ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
              id: favoritesMeals[index].id,
              title: favoritesMeals[index].title,
              imageUrl: favoritesMeals[index].imageURL,
              duration: favoritesMeals[index].duration,
              complexity: favoritesMeals[index].complexity,
              affordability: favoritesMeals[index].affordability);
        }),
        itemCount: favoritesMeals.length,
      );
    }
  }
}
