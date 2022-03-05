import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'favorite_screen.dart';
import '../widgets/main_drawer.dart';
import 'package:meals_app/models/meals.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;
 
     TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages ;

 
   int _selectedPageIndex = 0;

     @override
   initState(){
     _pages = [
    {
      'page': CategoriesScreen(),
       'title': 'Categories'
       },
     {
      'page': FavoriteScreen(widget.favoriteMeals),
       'title': 'Your Favorite'
       },
   ];
     super.initState();
   }
     
  void _selectPage(int index){
          setState(() {
            _selectedPageIndex = index;
          });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
          ),
          drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 6,
          backgroundColor: Colors.pink,
          onTap: _selectPage,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPageIndex,
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.category), 
              label: 'Categories',
              ),
                BottomNavigationBarItem(
              icon: Icon(Icons.star), 
              label: 'Favorites',
              ),
          ],
           ),
      
    
    );
  }
}