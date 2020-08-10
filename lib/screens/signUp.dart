import 'package:cookbook/components/appbar.dart';
import 'package:cookbook/components/gradientButton.dart';
import 'package:cookbook/components/textwidget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  double widht, height;

  @override
  Widget build(BuildContext context) {
    widht = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar(press: () {
        Navigator.pop(context);
      }),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: <Widget>[
                    Center(
                        child: textWidget(
                            title: 'Create account',
                            size: 30,
                            color: Colors.black)),
                    textWidget(
                        title:
                            'Please enter your credentials in the form bellow:',
                        color: Colors.grey,
                        size: 11)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: height * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/loginImage.png',
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      textWidgetCenter(
                          title: 'Don\'t have an account?',
                          size: 12,
                          color: Colors.grey),
                      TimetextWidget(
                          title: 'SIGN UP NOW',
                          size: 12,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Center(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: height * 0.6,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4)
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    textWidget(title: 'Name', size: 14, color: Colors.grey),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter your name',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.withOpacity(0.3),
                          )),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    textWidget(title: 'Email', size: 14, color: Colors.grey),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter email address',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.withOpacity(0.3),
                          )),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    textWidget(title: 'Password', size: 14, color: Colors.grey),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Choose a password',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.withOpacity(0.3),
                          )),
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    textWidget(title: 'Password', size: 14, color: Colors.grey),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Repeat password',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.withOpacity(0.3),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: height * 0.7,
              left: 10,
              right: 10,
              child: GradientButton(widht,
                  title: 'SIGNUP', margin: 35, press: () {}))
        ],
      ),
    );
  }
}
