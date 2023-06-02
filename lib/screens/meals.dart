import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    required this.title,
    required this.meals,
    super.key,
  });

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isNotEmpty
        ? ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) {
              return MealItem(meal: meals[index]);
              // for (final meal in meals) MealsItem(meal: meal);
            },
          )
        : Center(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Uh oh ... nothing here!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Try selecting a different category',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ],
          ));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
