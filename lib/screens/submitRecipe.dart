import 'package:cookbook/components/appbar.dart';
import 'package:cookbook/components/gradientButton.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:cookbook/constants/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class dropDownModel {
  String name;
  int id;

  dropDownModel(this.id, this.name);

  static List<dropDownModel> getCatagories() {
    return <dropDownModel>[
      dropDownModel(
        -1,
        'Categories',
      ),
      dropDownModel(
        0,
        'Asian',
      ),
      dropDownModel(
        1,
        'Indian',
      ),
      dropDownModel(
        2,
        'Fast-Food',
      ),
      dropDownModel(
        3,
        'BBQ',
      ),
      dropDownModel(
        4,
        'Healthy',
      ),
      dropDownModel(
        5,
        'Middle Eastern',
      ),
    ];
  }
}

class SubmitRecipe extends StatefulWidget {
  @override
  _SubmitRecipeState createState() => _SubmitRecipeState();
}

class _SubmitRecipeState extends State<SubmitRecipe> {
  double width, height;
  List<String> meals = ['BREAKFAST', 'VEGAN BESSERT', 'ITALIAN BRUNCH'];

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
      appBar: appBar(show: false),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          child: Column(
            children: <Widget>[
              textWidget(title: 'Submit your recipe', size: 20),
              SizedBox(
                height: 30,
              ),
              Container(
                width: width,
                margin: EdgeInsets.symmetric(horizontal: 20),
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
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: width,
                height: 195,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: textWidget(title: 'Add Photo', size: 14)),
                    Center(
                      child: Image.asset('assets/camera.png'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: width,
                height: 277,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ]),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      textWidget(title: 'Recipe Title'),
                      Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter your recipe title',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          )),
                      Divider(),
                      textWidget(title: 'Ingredients'),
                      Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Separate with comma',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          )),
                      Divider(),
                      textWidget(title: 'Direction'),
                      Container(
                          height: 40,
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Put every step with enter',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          )),
                      Divider()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GradientButton(width, title: 'ADD RECIPE', margin: 40)
            ],
          ),
        ),
      ),
    );
  }
}
