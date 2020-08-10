import 'package:cookbook/constants/appColors.dart';
import 'package:cookbook/screens/SearchScreen.dart';
import 'package:flutter/material.dart';

Widget SearchField(BuildContext context,{bool isReadonly = true}) {
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
          onTap: (){
               isReadonly ?  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SearchScreen())): null;
          },
          decoration: InputDecoration(

            hintText: 'Search recipes...',
              hintStyle: TextStyle(
                color: lightGreenColor
              ),
              enabledBorder: InputBorder.none, focusedBorder: InputBorder.none),
        )),
        isReadonly? Container() :IconButton(
          icon: Icon(Icons.clear,color: TabGreenColor,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}
