import 'package:cookbook/components/textwidget.dart';
import 'package:cookbook/constants/appColors.dart';
import 'package:flutter/material.dart';


Widget GradientButton(double width,{String title,Function press,double margin = 20,double height = 54}){
  return InkWell(
    onTap: press,
    child: Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: margin),
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(27),
          color: TabGreenColor,
          gradient: LinearGradient(colors: [GreenColor,TabGreenColor])
      ),
      child: Center(
        child: textWidget(
            title: title,
            color: Colors.white,
            size: 12),
      ),
    ),
  );
}