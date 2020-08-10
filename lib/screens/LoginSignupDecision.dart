import 'package:cookbook/components/gradientButton.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:cookbook/constants/appColors.dart';
import 'package:cookbook/screens/login.dart';
import 'package:flutter/material.dart';

import 'HomeStart.dart';

class LoginSignupDecision extends StatefulWidget {
  @override
  _LoginSignupDecisionState createState() => _LoginSignupDecisionState();
}

class _LoginSignupDecisionState extends State<LoginSignupDecision> {
  double width, height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage('assets/logo.jpg'), fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 15)
                    ]),
              ),
            ),
            SizedBox(
              height: 29,
            ),
            textWidget(title: 'Cookbook', size: 40),
            SizedBox(
              height: 17,
            ),
            TimetextWidget(
                title: 'Social media integrated recipes app',
                color: lightGreenColor,
                size: 15,
                fontWeight: FontWeight.normal),
            SizedBox(
              height: 100,
            ),
            MaterialButton(
              shape: StadiumBorder(),
              color: Colors.blue,
              minWidth: double.infinity,
              height: 55,
              onPressed: () {
//                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PopularRecipe()));
              },
              child: TimetextWidget(
                  title: 'CONTINUE WITH FACEBOOK',
                  size: 11,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            GradientButton(width, title: 'SIGN UP USING EMAIL', press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            }, margin: 0),
            SizedBox(
              height: 100,
            ),
            TimetextWidget(
                title: 'I aleady have an account.',
                size: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Login()));
                },
                child: TimetextWidget(
                  title: 'LOGIN NOW',
                  size: 12,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ),
    );
  }
}
