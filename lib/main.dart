import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';
import 'package:meals_app/models/category.dart';
import './categories_screen.dart';

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
        '/': (context) => CategoriesScreen(),
        CategoryMealScreen.routeName: ((context) => CategoryMealScreen()),
      },
    );
  }
}
