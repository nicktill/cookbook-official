import 'package:cookbook/components/ListOfRecipes.dart';
import 'package:cookbook/components/searchField.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:cookbook/constants/appColors.dart';
import 'package:cookbook/screens/PopularReceipe.dart';
import 'package:flutter/material.dart';

class dropDownModel {
  String name;
  int id;

  dropDownModel(this.id, this.name);

  static List<dropDownModel> getCatagories() {
    var dropDownModel2 = dropDownModel(
      6,
      'Categories',
    );
    return <dropDownModel>[
      dropDownModel(
        0,
        'Categories',
      ),
      dropDownModel(
        1,
        'Lunch',
      ),
      dropDownModel(
        2,
        'Dinner',
      ),
      dropDownModel(
        3,
        'BBQ',
      ),
      dropDownModel(
        4,
        'Chinese',
      ),
      dropDownModel(
        5,
        'Fusion',
      ),
      dropDownModel(
        6,
        'Breakfast',
      ),
      dropDownModel2,
    ];
  }
}

class Catagory extends StatefulWidget {
  @override
  _CatagoryState createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {
  double width, height;

  List<String> images = [
    'assets/image4.png',
    'assets/image5.png',
    'assets/image6.png',
  ];

  List<String> meals = [
    'BREAKFAST',
    'VEGAN BESSERT',
    'ITALIAN BRUNCH',
  ];

  List<dropDownModel> catagories = dropDownModel.getCatagories();

  List<DropdownMenuItem<dropDownModel>> _dropdownitems;

  dropDownModel catagoryItem;

  @override
  void initState() {
    _dropdownitems = buildCatagories(catagories);
    catagoryItem = _dropdownitems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<dropDownModel>> buildCatagories(List catagories) {
    List<DropdownMenuItem<dropDownModel>> items = List();
    for (dropDownModel item in catagories) {
      items.add(DropdownMenuItem(
          value: item,
          child: textWidget(title: item.name, color: TabGreenColor, size: 12)));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white12,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: textWidget(title: '', size: 30),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  textWidget(title: 'Catagory', size: 30),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(
                              color: GreenColor, spreadRadius: 1, blurRadius: 1)
                        ]),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: TabGreenColor,
                          ),
                          value: catagoryItem,
                          items: _dropdownitems,
                          onChanged: (dropDownModel value) {
                            setState(() {
                              catagoryItem = value;
                            });
                          }),
                    ),
                  ),
                ],
              )),
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
          ExpandedListOfRecipes(width, height, isCatagory: true)
        ],
      ),
    );
  }
}
