import 'package:flutter/material.dart';
import 'package:flashchat/Constants.dart';
import 'package:flashchat/Component/Rounded_Button.dart';
import 'package:geolocator/geolocator.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.person,
          size: 30.0,
          color: Colors.white,
        ),
        backgroundColor: Colors.teal,
        title: Text(
          'Form Application',
          style: TextStyle(letterSpacing: 2.0),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '//');
          },
          backgroundColor: Colors.teal,
          label: Icon(Icons.add)),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'images/logo.png',
                      height: 60,
                    ),
                    Text(
                      'User Detail',
                      style: Ktext,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
              ]),
        ),
      ),
    );
  }
}
