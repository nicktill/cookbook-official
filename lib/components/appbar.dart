import 'package:flutter/material.dart';

Widget appBar({Function press,bool show = true}) {
  return AppBar(
  backgroundColor: Colors.white.withOpacity(0.1),
  elevation: 0,
  leading: IconButton(
      icon: Icon(
        Icons.keyboard_backspace,
        color: show ? Colors.black : Colors.white,
      ),
      onPressed: press),
);
}


