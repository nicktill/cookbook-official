
import 'package:cookbook/components/ListOfRecipes.dart';
import 'package:cookbook/components/appbar.dart';
import 'package:cookbook/components/searchField.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:flutter/material.dart';

class PopularRecipe extends StatefulWidget {
  @override
  _PopularRecipeState createState() => _PopularRecipeState();
}

class _PopularRecipeState extends State<PopularRecipe> {

  double widht,height;

  @override
  Widget build(BuildContext context) {

    widht = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(press: () {}),
      body: Column(
        children: <Widget>[
          Container(
              child: Center(
                  child: textWidget(title: 'Popular Recipes', size: 30))),
          SizedBox(
            height: 26,
          ),
          SearchField(context),
          SizedBox(
            height: 10,
          ),
          ExpandedListOfRecipes(widht,height)
        ],
      ),
    );
  }
}

