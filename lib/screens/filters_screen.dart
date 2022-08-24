import 'package:flutter/material.dart';
import 'package:recipes/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final dynamic saveFilters;
  FilterScreen({required this.saveFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegeterian = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, dynamic updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters!'),
          actions: [
            IconButton(
              onPressed: (() {
                final filters = {
                  'gluten-free': false,
                  'lactose-free': false,
                  'vegan': false,
                  'vegetarian': false,
                };

                widget.saveFilters(filters);
              }),
              icon: const Icon(Icons.save),
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTile(
                    'Gluten-Free',
                    'Only include gluten-free meals',
                    _glutenFree,
                    (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'Lactose-Free',
                    'Only include lactose-free meals',
                    _lactoseFree,
                    (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'Vegan',
                    'Only include vegan meals',
                    _vegan,
                    (value) {
                      setState(() {
                        _vegan = value;
                      });
                    },
                  ),
                  buildSwitchListTile(
                    'Vegetarian',
                    'Only include vegetarian meals',
                    _vegeterian,
                    (value) {
                      setState(() {
                        _vegeterian = value;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
