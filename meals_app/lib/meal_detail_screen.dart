

import 'package:flutter/material.dart';
import 'package:meals_app/Meal.dart';
import './dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName ='/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

   MealDetailScreen
    (
      this.toggleFavourite,
      this.isFavourite
    );

  Widget buildSectionTitle(BuildContext context, String text)
  {
    return Container
            (
              color: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                text,style: Theme.of(context).textTheme.subtitle1, 
              ),
            );
  }

 Widget buildContainer(Widget child)
 {
    return Container(
              decoration: BoxDecoration(
                color:Colors.white,
                border: Border.all(
                  color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              height: 150.0,
              width: 300.0,
              child: child
     );
 }

 

  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((Meal)=> Meal.id ==mealId );
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes: ${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: double.infinity,
              child: Image.network
              (
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
              ),
             buildSectionTitle(context,'Ingredients'),
             buildContainer(
               ListView.builder(
                  itemBuilder: (ctx, index) =>Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 10.0
                      ),
                      child: Text(selectedMeal.ingredients[index])),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
             ),
              
              buildSectionTitle(context,'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      textColor:Theme.of(context).accentColor,
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),)
          ],
        ),
      ),
      //remove the Recipes
      // floatingActionButton: FloatingActionButton
      // (
      //   child: Icon(Icons.delete),
      //   onPressed: (){
      //     Navigator.of(context).pop(mealId);
      //   },
      // ),

      floatingActionButton: FloatingActionButton
      (
        child: Icon(
          isFavourite(mealId) ? Icons.star:Icons.star_border,
        ),
        // onPressed:toggleFavourite(mealId),
        onPressed: () => toggleFavourite(mealId),
      ),
      
    );
  }
}