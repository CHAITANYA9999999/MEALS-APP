import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text(categoryTitle.toString()),
      ),
    );
  }
}
