
import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function? saveFilters;
  final Map<String, bool> currentFilters;
   FiltersScreen(this.currentFilters ,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree =  false;
  

  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
  
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
     bool currentValue,
    Function updateValue,
   ){
        return SwitchListTile(
          title: Text(title),
          value: currentValue,
          subtitle: Text(
           description
            ),
           onChanged: (val)=> updateValue(val),
           );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
             icon: Icon(Icons.save),
            onPressed:() {
              final selectedFilters = {
                
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
          }; 
              widget.saveFilters!(selectedFilters);
              } ,
          ),
        ],
      ),
     drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meal selection', 
          style:TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
         Expanded(
           child: ListView(
                 children: <Widget>[
                   _buildSwitchListTile(
                     'Gluten-free',
                      'Only include Gluten-free meals',
                       _glutenFree,
                      (newValue){
                             setState(() {
                               _glutenFree =  newValue;
                             });
                      }
                      ),
                              _buildSwitchListTile(
                     'Lactose-free',
                      'Only include lactose-free meals',
                       _lactoseFree,
                      (newValue){
                             setState(() {
                               _lactoseFree =  newValue;
                             });
                      }
                      ),
                                 _buildSwitchListTile(
                     'Vegetarian',
                      'Only include Vegetarian meals',
                       _vegetarian,
                      (newValue){
                             setState(() {
                               _vegetarian =  newValue;
                             });
                      }
                      ),
                                   _buildSwitchListTile(
                     'Vegan',
                      'Only include Vegan meals',
                       _vegan,
                      (newValue){
                             setState(() {
                               _vegan =  newValue;
                             }
                             );
                      }
                      ),
                 ],
         ),
         ),
        ],
      ),
    );
  }
}