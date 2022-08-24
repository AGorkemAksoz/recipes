import 'package:flutter/material.dart';
import 'package:recipes/screens/filters_screen.dart';
import 'package:recipes/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(IconData icon, String text, dynamic onTapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Cooking Time',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            buildListTile(Icons.restaurant, 'Meals', () {
              Navigator.of(context).pushReplacementNamed(TabsScreen.routName);
            }),
            buildListTile(Icons.settings, 'Filters', () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
