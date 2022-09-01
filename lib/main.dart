import 'package:flutter/material.dart';
import 'package:recipes/data/dummy_data.dart' as prefix;
import 'package:recipes/screens/favorites_screen.dart';
import './data/dummy_data.dart';
import './screens/filters_screen.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<dynamic> _availableMeals = DUMMY_MEALS;
  final List<dynamic> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] != null && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] != null && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] != null && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] != null && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toogleFavorites(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals.add(
          prefix.DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
        print(_favoritedMeals.toString());
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensend',
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      routes: {
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
            toogleFavorites: _toogleFavorites, isMealFavorite: _isMealFavorite),
        TabsScreen.routName: (ctx) =>
            TabsScreen(favoritesMeals: _favoritedMeals),
        FilterScreen.routeName: (ctx) => FilterScreen(saveFilters: _setFilters),
        // FavoritesScreen.routeName: (ctx) => FavoritesScreen(favoritesMeals: _favoritedMeals),
      },
    );
  }
}
