import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import './dummay_data.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DeliMeals')),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //*maxCrossAxisExtent is kitni max width ho sakti hai ek element ki
            maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.45,
            //*height to width ratio, i.e. agar width=200 then height=300
            childAspectRatio: 3 / 2,
            crossAxisSpacing: MediaQuery.of(context).size.width * 0.1,
            mainAxisSpacing: MediaQuery.of(context).size.height * 0.03),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(
                  id: e.id,
                  title: e.title,
                  color: e.color,
                ))
            .toList(),
      ),
    );
  }
}
