import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  // final String categoryId;
  // final String categoryTitle;
  // const displayedMealcreen(
  //     {super.key, required this.categoryId, required this.categoryTitle});
  final List<Meal> availableMeals;

  static const routeName = '/category-meals';

  const CategoryMealScreen({super.key, required this.availableMeals});

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeal;
  bool _loadedInitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      categoryTitle = routeArgs['title'] as String?;
      final categoryId = routeArgs['id'];

      displayedMeal = widget.availableMeals.where(((element) {
        return (element.categories.contains(categoryId));
      })).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal?.removeWhere((element) => (element.id == mealId));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
              id: displayedMeal![index].id,
              title: displayedMeal![index].title,
              imageUrl: displayedMeal![index].imageUrl,
              duration: displayedMeal![index].duration,
              complexity: displayedMeal![index].complexity,
              affordability: displayedMeal![index].affordability,
              removeItem: _removeMeal,
            );
          }),
          itemCount: displayedMeal!.length,
        ));
  }
}
