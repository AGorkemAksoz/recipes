import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
/*   final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen({
    required this.categoryId,
    required this.categoryTitle,
  }); */
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final routeId = routeArgs['id'];
    final routeTitle = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(routeTitle!),
      ),
      body: const Center(
        child: Text('The Recipes For The Category!'),
      ),
    );
  }
}