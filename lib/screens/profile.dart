import 'package:cookbook/components/gradientButton.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:cookbook/screens/likedRecipes.dart';
import 'package:cookbook/screens/myrecipes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double width, height;

  List<String> images = [
    'assets/image1.png',
    'assets/image3.png',
  ];

  List<String> title = [
    'My Recipes',
    'Recipes I Likes',
  ];

  List<String> subtitle = [
    '23 Recipes',
    '23 Recipes',
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: width,
                height: width * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/login_image.jpg'),
                        fit: BoxFit.fitWidth)),
              ),
              SizedBox(
                height: width * 0.2,
              ),
              textWidgetCenter(title: 'Nicholas Tillmann', size: 20),
              textWidgetCenter(
                  title: 'Philadelphia, PA', size: 14, color: Colors.grey),
              SizedBox(
                height: width * 0.05,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 70,
                child: Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          children: <Widget>[
                            textWidget(
                              title: '56',
                              size: 20,
                            ),
                            textWidget(
                                title: 'Recipes', size: 14, color: Colors.grey),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          textWidget(
                            title: '14k',
                            size: 20,
                          ),
                          textWidget(
                              title: 'Views', size: 14, color: Colors.grey),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Column(
                          children: <Widget>[
                            textWidget(
                              title: '1.3k',
                              size: 20,
                            ),
                            textWidget(
                                title: 'Followers',
                                size: 14,
                                color: Colors.grey),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: width * 0.05,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.builder(
                      itemCount: images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 15,
                          childAspectRatio: 3 / 4),
                      itemBuilder: (BuildContext context, i) {
                        return InkWell(
                          onTap: () {
                            i == 0
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyRecipes()))
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LikedRecipes()));
                          },
                          child: Container(
                            width: 160,
                            height: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 155,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(images[i]),
                                        fit: BoxFit.scaleDown),
                                  ),
                                ),
                                textWidget(title: title[i], size: 18),
                                textWidget(
                                    title: subtitle[i],
                                    size: 12,
                                    color: Colors.grey),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
          Positioned(
            top: width * 0.3,
            left: width * 0.33,
            right: width * 0.33,
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5)
              ]),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 65,
                child: CircleAvatar(
                  radius: 58,
                  backgroundImage: AssetImage('assets/0.jpg'),
                ),
              ),
            ),
          ),
          Positioned(
            top: width * 0.4,
            left: width * 0.6,
            right: width * 0.1,
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5)
              ]),
              child: GradientButton(width,
                  title: 'FOLLOWING', margin: 0, press: () {}, height: 40),
            ),
          ),
        ],
      ),
    );
  }
}
