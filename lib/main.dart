import 'package:flutter/material.dart';
import 'package:flashchat/Welcome.dart';
import 'package:flashchat/Maps.dart';
import 'package:flashchat/Detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flashChat',
      initialRoute: '/',
      routes: {
        '/': (context) => Welcome(),
        '//': (context) => Detail(),
        '///': (context) => MapsUp(),
      },
    );
  }
}
