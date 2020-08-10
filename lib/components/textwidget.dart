import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textWidget({String title,double size,Color color = Colors.black}){
  return Text(title,style: GoogleFonts.poppins(fontSize: size,color: color),textAlign: TextAlign.left,);
}

Widget textWidgetCenter({String title,double size,Color color = Colors.black}){
  return Text(title,style: GoogleFonts.poppins(fontSize: size,color: color),textAlign: TextAlign.center,);
}


Widget TimetextWidget({String title,double size,Color color = Colors.black,FontWeight fontWeight = FontWeight.bold}){
  return Text('$title ',style: GoogleFonts.poppins(fontSize: size,color: color,fontWeight: fontWeight,));
}