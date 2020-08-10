import 'package:cookbook/components/ListOfRecipes.dart';
import 'package:cookbook/components/appbar.dart';
import 'package:cookbook/components/gradientButton.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:cookbook/constants/appColors.dart';
import 'package:cookbook/screens/ShoppingList.dart';
import 'package:flutter/material.dart';

class RecipeDetal1 extends StatefulWidget {
  final String title, image;

  RecipeDetal1({this.title, this.image});

  @override
  _RecipeDetal1State createState() => _RecipeDetal1State();
}

class _RecipeDetal1State extends State<RecipeDetal1> {
  double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar(press: () {
        Navigator.pop(context);
      }),
      body: Container(
        //margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                width: width * 0.5,
                child: textWidgetCenter(title: widget.title, size: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  width: width,
                  height: height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
                            spreadRadius: 1),
                      ],
                      image: DecorationImage(
                          image: AssetImage(widget.image), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                ),
                Positioned(
                    top: 27,
                    right: 20,
                    child: Container(
                      height: 30,
                      width: 58,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 1,
                                spreadRadius: 2)
                          ],
                          color: pinkColorB,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                          Text(
                            '220',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              height: height * 0.34,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: width,
                    height: height * 0.3,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5)
                        ]),
                    child: Container(

                        //height: 165,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CookingDataC(width,
                                    image: 'assets/cooktime.png',
                                    title: '20 min',
                                    subtitle: 'Cooking Time'),
                                CookingDataC(width,
                                    image: 'assets/difficulty.png',
                                    subtitle: 'Difficulty',
                                    title: 'Medium'),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CookingDataC(width,
                                    image: 'assets/check-all.png',
                                    title: '8',
                                    subtitle: 'Ingredients'),
                                CookingDataC(width,
                                    image: 'assets/serving.png',
                                    subtitle: 'per Serving',
                                    title: '200'),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: GradientButton(width, title: 'Shopping List',
                          press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => ShoppingList(
                                      image: widget.image,
                                      title: widget.title,
                                    )));
                      }, margin: 35)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget CookingDataC(double width,
    {String image, String title, String subtitle}) {
  return Container(
    height: 60,
    width: 136,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2)
      ],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.only(left: 10.0),
//          child: Image.asset(image),
//        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              textWidget(title: title, size: 15, color: TabGreenColor),
              textWidget(title: subtitle, size: 11, color: Colors.grey),
            ],
          ),
        )
      ],
    ),
  );
}
