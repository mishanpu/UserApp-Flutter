import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class LastPage extends StatelessWidget {
  File data;
  String name;
  String address;
  String color;
  String hobby;
  String loc;
  LastPage(
      {this.name, this.address, this.data, this.color, this.hobby, this.loc});

  Widget imagechecker() {
    if (data == null)
      return Text(
        'No Image Found',
        style: TextStyle(
          fontFamily: 'Source Sans Pro',
          color: Colors.teal.shade100,
          fontSize: 20.0,
          letterSpacing: 2.5,
          fontWeight: FontWeight.bold,
        ),
      );
    else
      return Image.file(
        data,
        height: 150,
        width: 125,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text('Edit'),
        backgroundColor: Colors.teal,
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          imagechecker(),
          Text(
            name == null ? 'Enter value' : name,
            style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            loc == null ? 'Enter value' : loc,
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              color: Colors.teal.shade100,
              fontSize: 20.0,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
            width: 150.0,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.accessibility,
                  color: Colors.teal,
                ),
                title: Text(
                  hobby == null ? 'Enter value' : hobby,
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.location_city,
                  color: Colors.teal,
                ),
                title: Text(
                  address == null ? 'Enter value' : address,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro'),
                ),
              )),
          Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.format_paint,
                  color: Colors.teal,
                ),
                title: Text(
                  color == null ? 'Enter value' : color,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                      fontFamily: 'Source Sans Pro'),
                ),
              ))
        ],
      )),
    );
  }
}
