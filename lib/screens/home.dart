import 'package:cookbook/components/ListOfRecipes.dart';
import 'package:cookbook/components/searchField.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:cookbook/constants/appColors.dart';
import 'package:cookbook/screens/PopularReceipe.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width, height;

  List<String> images = [
    'assets/image4.png',
    'assets/image5.png',
    'assets/image6.png',
    'assets/login_image.jpg',
  ];

  List<String> meals = ['VEGAN', 'HEALTHY', 'ITALIAN'];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: textWidget(title: 'Home', size: 30),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 38,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: SearchField(context),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 80,
            margin: EdgeInsets.only(left: 15),
            child: ListView.builder(
              itemBuilder: (BuildContext context, i) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  width: width * 0.34,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 1)
                    ],
                    color: Colors.black12,
                    image: DecorationImage(
                        image: AssetImage(images[i]),
                        fit: BoxFit.fill,
                        colorFilter:
                            ColorFilter.mode(Colors.black38, BlendMode.darken)),
                  ),
                  child: Center(
                    child: TimetextWidget(
                      title: meals[i],
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              itemCount: 3, //ITEM COUNT FOR NUBER OF CATEGORIES
              scrollDirection: Axis.horizontal,
            ),
          ),
          ListTile(
            leading: textWidget(title: 'Explore', size: 20),
            trailing:
                textWidget(title: 'VIEW ALL', size: 11, color: GreenColor),
          ),
          ExpandedListOfRecipes(width, height, isCatagory: false)
        ],
      ),
    );
  }
}
