import 'package:cookbook/components/textwidget.dart';
import 'package:flutter/material.dart';

Widget popularReceipeItem(
    {String image, double width, String dishName, String time,Function model,bool isLikedRecipes = false}) {
  return InkWell(
    onTap: model,
    child: Container(
      height: 220,
      margin: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2),
          ]),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
              right: 10,
              child: Container(
            height: 30,
            width: 58,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 1,
                  spreadRadius: 2
                )
              ],
                color: isLikedRecipes ? Colors.pink : Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.favorite_border,
                  color: isLikedRecipes ? Colors.white : Colors.pink,
                ),
                Text('220',style: TextStyle(color:isLikedRecipes ? Colors.white : Colors.black ),)
              ],
            ),
          )),
          Positioned(
            bottom: 15,
            child: Container(
              height: 110,
              padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  textWidget(size: 18, title: dishName),
                  TimetextWidget(size: 12, title: '$time minutes cooking time', color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
