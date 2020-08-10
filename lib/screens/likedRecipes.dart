import 'package:cookbook/components/ListOfRecipes.dart';
import 'package:cookbook/components/appbar.dart';
import 'package:cookbook/components/searchField.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:flutter/material.dart';

class LikedRecipes extends StatefulWidget {
  bool isLikedNotFromTab ;
  LikedRecipes({this.isLikedNotFromTab = true});
  @override
  _LikedRecipesState createState() => _LikedRecipesState();
}

class _LikedRecipesState extends State<LikedRecipes> {

  double width,height;
  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(press: (){Navigator.pop(context);},show: widget.isLikedNotFromTab),
      body: Container(
        width: width,
        height: height,
        child: Column(
          children: <Widget>[
            textWidget(title: 'Recipes I Liked',size: 30),
            SizedBox(
              height: 30,
            ),
            SearchField(context),
            ExpandedListOfRecipes(width, height,likedRecipes: true),
          ],
        ),
      ),
    );
  }
}
