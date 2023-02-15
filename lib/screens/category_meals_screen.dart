import 'package:flutter/material.dart';
import 'package:meals_app/dummay_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMealScreen(
  //     {super.key, required this.categoryId, required this.categoryTitle});

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryColor = routeArgs['color'];

    final categoryMeals = DUMMY_MEALS.where(((element) {
      return (element.categories.contains(categoryId));
    })).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imageUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          }),
          itemCount: categoryMeals.length,
        ));
  }
}
