import 'package:cookbook/components/textwidget.dart';
import 'package:cookbook/constants/appColors.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double width, height;

  bool isSearchTaped = false;

  List<String> keywords = [
    '“breakfast”',
    '“avocado salad”',
    '“italian food”',
    '“dinner”',
    '“chinese recipe”',
    '“blueberry”'
  ];

  List<String> images = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  List<String> dishName = [
    'Lanb and Spinach Curry Recipe',
    'Beautiful Burger Buns Recipe',
    'Morning Cookies with Fresh Milk'
  ];

  List<String> times = ['30', '20', '30'];

  List<String> subtitles = [
    "If there's one dish guaranteed to be on…",
    "Prepare grill for medium-high heat oil...",
    "If one pasta dish exemplifies the comp…",
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            SearchFieldH(context, isReadonly: false),
            SizedBox(
              height: isSearchTaped ? 20 : 110,
            ),
            isSearchTaped
                ? Container(
                    width: width,
                    height: width * 0.7,
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        textWidget(
                          title: 'Popular Keywords',
                          size: 18,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, i) {
                              return Container(
                                height: 30,
                                child: ListTile(
                                  leading: Image.asset('assets/search.png'),
                                  title: textWidget(
                                      title: keywords[i],
                                      size: 18,
                                      color: searchColor),
                                ),
                              );
                            },
                            itemCount: keywords.length,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: width,
                    height: width,
                  ),
            SizedBox(
              height: isSearchTaped ? 20 : 1,
            ),
            isSearchTaped
                ? Container(
                    width: width,
                    height: width,
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        textWidget(
                          title: 'Popular Recipes',
                          size: 18,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, i) {
                              return ListTile(
                                leading: Container(
                                  width: 73,
                                  height: 69,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                            spreadRadius: 1)
                                      ],
                                      image: DecorationImage(
                                          image: AssetImage(images[i]))),
                                ),
                                title: textWidget(
                                  title: dishName[i],
                                  size: 14,
                                ),
                                subtitle: textWidget(
                                    title: subtitles[i],
                                    color: Colors.grey,
                                    size: 12),
                                trailing: Container(
                                  height: 30,
                                  width: 58,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            blurRadius: 1,
                                            spreadRadius: 2)
                                      ],
                                      color: i == 1 ? pinkColorB : Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.favorite_border,
                                        color:
                                            i == 1 ? Colors.white : pinkColorB,
                                      ),
                                      Text(
                                        '220',
                                        style: TextStyle(
                                            color: i == 1
                                                ? Colors.white
                                                : Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: dishName.length,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget SearchFieldH(BuildContext context, {bool isReadonly = true}) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(27),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 2,
                color: Colors.black.withOpacity(0.05))
          ]),
      child: Row(
        children: <Widget>[
          Image.asset('assets/search.png'),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextFormField(
            readOnly: isReadonly,
            onTap: () {
              isReadonly
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => SearchScreen()))
                  : setState(() {
                      isSearchTaped = true;
                    });
            },
            decoration: InputDecoration(
                hintText: 'Search recipes...',
                hintStyle: TextStyle(color: lightGreenColor),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          )),
          isReadonly
              ? Container()
              : IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: TabGreenColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
        ],
      ),
    );
  }
}
