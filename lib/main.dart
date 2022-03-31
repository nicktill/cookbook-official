import 'package:cookbook/screens/LoginSignupDecision.dart';
import 'package:flutter/material.dart';

//setting head
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cook Book',
      home: LoginSignupDecision(),
      // 
    );
  }
}

