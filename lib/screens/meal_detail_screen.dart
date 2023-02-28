import 'package:flutter/material.dart';
import '../dummay_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments;
    final selectMeal = DUMMY_MEALS.firstWhere(
      (element) => (element.id == mealId),
    );
    return Scaffold(
      appBar: AppBar(title: Text('${selectMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Card(
                      color: Theme.of(context).accentColor,
                      child: Text(selectMeal.ingredients[index]),
                    ),
                  );
                }),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text('#${index + 1}')),
                      title: Text(selectMeal.steps[index]),
                    ),
                    Divider(
                      color: Colors.black,
                    )
                  ],
                );
              }),
              itemCount: selectMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          Navigator.of(context).pop(mealId);
        }),
        child: Icon(Icons.delete),
      ),
    );
  }
}
