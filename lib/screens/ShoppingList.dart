import 'package:cookbook/components/appbar.dart';
import 'package:cookbook/components/gradientButton.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShoppingList extends StatefulWidget {
  String title, image;

  ShoppingList({this.image, this.title});

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  double width, height;

  bool isStartCooking = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: appBar(press: () {
        Navigator.pop(context);
      }),
      body: Stack(
        children: <Widget>[
          Column(
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
              Container(
                height: height * 0.4,
                width: width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.image), fit: BoxFit.fill)),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              height: height * 0.65,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Stack(
                children: <Widget>[
                  !isStartCooking ? buildCheckList() : buildDirection(),
                  !isStartCooking
                      ? Align(
                          alignment: Alignment.bottomCenter,
                          child: GradientButton(width, title: 'START COOKING',
                              press: () {
                            setState(() {
                              isStartCooking = true;
                            });
                          }, margin: 20))
                      : Container()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildCheckList() {
    List<String> title = [
      'Flour',
      'Milk',
      'Baking Powder',
      'Fruit',
      'Olive Oil',
      'Sugar'
    ];
    // ignore: non_constant_identifier_names
    List<String> Subtitle = [
      '250 g',
      '550 ml',
      '100g',
      '750 g',
      '150 ml',
      '200 g'
    ];

    return ListView.builder(
      itemBuilder: (BuildContext context, i) {
        return CheckListItem(
          title: title[i],
          Subtitle: Subtitle[i],
        );
      },
      itemCount: title.length,
    );
  }

  buildDirection() {
    List<String> dirctions = [
      'By hand: sift the flour into a bowl and make a well in the middle.',
      ' Break in the egg (and yolk, if using) and add apinch of salt and a splash of the milk. Whisk the egg, ',
      'With a blender: put all the ingredients in a blender jug with a pinch of salt. Whizz until smooth. It should be no thicker than cream.',
      'Brush a hot pan with vegetable oil before adding a ladleful of batter and swilling thinly around pan.',
      'Moisten a paper towel with vegetable oil and use it to lightly wipe the bottom of the pan. This will keep the pancakes from sticking.'
    ];

    return Container(
      margin: EdgeInsets.only(left: 19, right: 19, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textWidget(size: 18, color: Colors.black, title: 'Direction'),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            child: ListView.builder(
              itemBuilder: (BuildContext context, i) {
                return ListTile(
                  leading: CircleAvatar(
                    child: textWidget(title: '$i', color: Colors.white),
                    backgroundColor: Colors.grey,
                  ),
                  title: textWidget(
                      title: dirctions[i], size: 14, color: Colors.grey),
                );
              },
              itemCount: 5,
            ),
          ))
        ],
      ),
    );
  }
}

class CheckListItem extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String title, Subtitle;

  // ignore: non_constant_identifier_names
  CheckListItem({this.title, this.Subtitle});

  @override
  _CheckListItemState createState() => _CheckListItemState();
}

class _CheckListItemState extends State<CheckListItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textWidget(title: widget.title, color: Colors.black, size: 18),
          textWidget(title: widget.Subtitle, color: Colors.grey, size: 14),
        ],
      ),
      trailing: Checkbox(
          value: isSelected,
          onChanged: (v) {
            setState(() {
              isSelected = v;
            });
          }),
    );
  }
}
