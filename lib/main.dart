import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'package:meals_app/models/category.dart';
import 'screens/categories_screen.dart';
import 'screens/meal_detail_screen.dart';
import './screens/tabs_screeen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        CategoryMealScreen.routeName: ((context) => CategoryMealScreen()),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
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
