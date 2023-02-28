import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-screen';
  final Function saveFilters;
  final Map<String, bool> savedFilters;
  const FilterScreen(
      {super.key, required this.saveFilters, required this.savedFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  SwitchListTile _buildSwitchListTile(
    String title,
    String description,
    bool currentvalue,
    Function(bool) updateValue,
  ) {
    //*It is a listTile with a switch
    return SwitchListTile(
      value: currentvalue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: (() {
                  widget.saveFilters(widget.savedFilters);
                }),
                icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal here',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten free meals',
                  widget.savedFilters['gluten'] as bool,
                  (newValue) {
                    setState(() {
                      widget.savedFilters['gluten'] = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include Lactose free meals',
                  widget.savedFilters['lactose'] as bool,
                  (newValue) {
                    setState(() {
                      widget.savedFilters['lactose'] = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  widget.savedFilters['vegetarian'] as bool,
                  (newValue) {
                    setState(() {
                      widget.savedFilters['vegetarian'] = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals',
                  widget.savedFilters['vegan'] as bool,
                  (newValue) {
                    setState(() {
                      widget.savedFilters['vegan'] = newValue;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
