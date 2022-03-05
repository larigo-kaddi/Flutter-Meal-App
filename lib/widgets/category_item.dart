import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';


// this Class shows the Category Item Caracter (Its title and its Color)
//it contains  a tap Grids to Navigate through the Category_Meals_Screen

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

     CategoryItem(this.id, this.title, this.color);

// A methode which select the category type in the grid view and navigate through it 

     void selectCategory(BuildContext ctx){
        Navigator.of(ctx).pushNamed(
          CategoryMealsScreen.RouteName,
           arguments: <String, String>{'id': id, 'title':title},
            );
     }
     // end of the method
  @override
  Widget build(BuildContext context) {
    //Imkwell it's a type of a Gesture Detector
    return InkWell(
      onTap: ()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
           padding: const EdgeInsets.all(15),
           child: Text(title, 
           style: TextStyle(
             fontSize: 20,
             fontFamily: 'RobotoCondensed',
             fontWeight: FontWeight.bold
           ),
           ),
           decoration: BoxDecoration(
             gradient: LinearGradient(
               colors: [
                 color.withOpacity(0.7),
                 color,
                  ],
                  begin: Alignment.topLeft,
                  end:Alignment.bottomRight,
                
                  ),
                  borderRadius: BorderRadius.circular(15)
           ),
      ),
    );
  }
}