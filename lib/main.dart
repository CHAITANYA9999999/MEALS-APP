import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/meal_detail_screen.dart';
import './screens/tabs_screeen.dart';
import './screens/filter_screen.dart';
import './dummay_data.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeal = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] == true && element.isGlutenFree == false) {
          return false;
        }
        if (_filters['lactose'] == true && element.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegan'] == true && element.isVegan == false) {
          return false;
        }
        if (_filters['vegetarian'] == true && element.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleMedium: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(),
        CategoryMealScreen.routeName: ((context) => CategoryMealScreen(
              availableMeals: _availableMeal,
            )),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(
              saveFilters: _setFilters,
              savedFilters: _filters,
            ),
      },

      //*If you are trying to reach a route that is not registered on
      //*the main routes then this will be the default route
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: ((context) => CategoriesScreen()));
      },
      // onUnknownRoute: ((settings) => MaterialPageRoute(builder: ((context) => CategoriesScreen())))
    );
  }
}
