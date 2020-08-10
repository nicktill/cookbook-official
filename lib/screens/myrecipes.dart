import 'package:cookbook/components/ListOfRecipes.dart';
import 'package:cookbook/components/appbar.dart';
import 'package:cookbook/components/searchField.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:flutter/material.dart';

class MyRecipes extends StatefulWidget {
  @override
  _MyRecipesState createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> {

  double width,height;
  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(press: (){Navigator.pop(context);}),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: <Widget>[
            textWidget(title: 'My Recipes',size: 30),
            SizedBox(
              height: 30,
            ),
            SearchField(context),
            ExpandedListOfRecipes(width, height),
          ],
        ),
      ),
    );
  }
}
