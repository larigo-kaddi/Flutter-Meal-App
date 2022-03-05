import 'package:flutter/material.dart';
import 'package:meals_app/models/meals.dart';
import '/dummy_data.dart';
import '../widgets/meal_item.dart';
import 'package:meals_app/models/meals.dart';

class CategoryMealsScreen  extends StatefulWidget {

   static const RouteName= '/categories-meals';
   final List<Meal> availableMeals;

    CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
     String? categoryTitle;
     List<Meal>? displayedMeals;
     var _loadedInitData = false;
   @override

@override
  void didChangeDependencies() {
    if(!_loadedInitData){
                 final routeArgs = 
     ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id']!;
  // var  categoryTitle = routeArgs['title'] ?? 'default'; or you you this 
         categoryTitle = routeArgs['title']!;
       //////////////////////////////////////////////////////////////////////////////
      
    displayedMeals = widget.availableMeals.where((meal){
    ///// if that categoryId is included in the categories of our meals 
         // than this Meal belong to that category
        return meal.categories.contains(categoryId);     
     }).toList();
     _loadedInitData = true;
    }
    
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  void _removeMeal(String mealId){
   setState(() {
     displayedMeals?.removeWhere((meal) => meal.id == mealId);
});
     
  }
  @override
  Widget build(BuildContext context) {
   
       
      
///////////////////////////////////////////////////////////////////////////////////////
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(itemBuilder: (ctx, index){
              return MealItem(
                id: displayedMeals![index].id,
                title: displayedMeals![index].title,
                imageUrl: displayedMeals![index].imageUrl,
                duration: displayedMeals![index].duration,
                complexity: displayedMeals![index].complexity,
                affordability: displayedMeals![index].affordability,
               
              );
      },
      itemCount: displayedMeals!.length,
      ) , 
        );
  }
}