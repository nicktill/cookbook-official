
import 'package:cookbook/constants/appColors.dart';
import 'package:cookbook/screens/likedRecipes.dart';
import 'package:cookbook/screens/profile.dart';
import 'package:cookbook/screens/submitRecipe.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'catagory.dart';
import 'home.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List screens = [HomePage(),LikedRecipes(isLikedNotFromTab: false,),SubmitRecipe(),Catagory(),ProfileScreen()];

  int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          showSelectedItemShadow: false,
          barBackgroundColor: Colors.white,
          barHeight: 40,
          itemWidth: 50,
          unselectedItemIconColor: TabGreenColor.withOpacity(0.4),
          selectedItemBackgroundColor: TabGreenColor,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.white,
        ),
        selectedIndex: currentPage,
        onSelectTab: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.favorite_border,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.add,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.layers,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.person_outline,
            label: '',
          ),
        ],
      ),
      body: screens[currentPage],

    );
  }
}

