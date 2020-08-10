import 'package:cookbook/components/gradientButton.dart';
import 'package:cookbook/components/popularRecipeItem.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:cookbook/constants/appColors.dart';
import 'package:cookbook/screens/RecipeDetail1.dart';
import 'package:flutter/material.dart';

Widget ExpandedListOfRecipes(double width,double height,{bool isCatagory = false,bool likedRecipes = false}) {
  List<String> images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  List<String> dishName = [
    'Lamb and Spinach Curry Recipe',
    'Beautiful Burger Buns Recipe',
    'Morning Cookies with Fresh Milk'
  ];

  List<String> times = ['30', '20', '30'];

  return Expanded(
    child: ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      itemBuilder: (BuildContext context, i) {
        return InkWell(
          onTap: () {
            isCatagory ? Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>RecipeDetal1(
              title: dishName[i],
              image: images[i],
            ))) : showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    height: height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40),
                        )),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    height: height * 0.2,
                                    width: width * 0.5,
                                    margin: EdgeInsets.only(top: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.black12,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 1,
                                              spreadRadius: 2)
                                        ],
                                        image: DecorationImage(
                                            image: AssetImage(images[i]),
                                            fit: BoxFit.fill)),
                                  ),
                                ),
                                Positioned(
                                    top: 47,
                                    right: 45,
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
                                          color: pinkColorB, borderRadius: BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                          ),
                                          Text('220',style: TextStyle(color: Colors.white),)
                                        ],
                                      ),
                                    )),

                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              child: textWidgetCenter(
                                title: dishName[i],
                                size: 20,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 165,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      CookingData(
                                        width,
                                          image: 'assets/cooktime.png',
                                          title: '20 min',
                                          subtitle: 'Cooking Time'),
                                      CookingData(
                                        width,
                                          image: 'assets/difficulty.png',
                                          subtitle: 'Difficulty',
                                          title: 'Medium'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      CookingData(
                                        width,
                                          image: 'assets/check-all.png',
                                          title: '8',
                                          subtitle: 'Ingredients'),
                                      CookingData(
                                        width,
                                          image: 'assets/serving.png',
                                          subtitle: 'per Serving',
                                          title: '200'),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          GradientButton(
                              width,
                              title: 'START COOKING',press: (){},margin: 20),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
          child: popularReceipeItem(
            width: MediaQuery.of(context).size.width * 0.65,
            image: images[i],
            dishName: dishName[i],
            time: times[i],
            isLikedRecipes: likedRecipes
          ),
        );
      },
      itemCount: 3,
    ),
  );
}

Widget CookingData(double width,{String image, String title, String subtitle}) {
  return Container(
    height: 75,
    width: width * 0.4,
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
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Image.asset(image),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              textWidget(title: title, size: 18, color: TabGreenColor),
              textWidget(title: subtitle, size: 12, color: Colors.grey),
            ],
          ),
        )
      ],
    ),
  );
}
