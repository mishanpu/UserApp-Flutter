import 'dart:convert';
import 'package:flashchat/Maps.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/Component/Rounded_Button.dart';
import 'package:flashchat/Constants.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'LastPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flashchat/Network.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  File _image;
  String name;
  String Address;
  String Hobby;
  String favCol = 'Green';
  String location;
  @override
  void initState() {
    super.initState();
    getlatlong();
  }

  Future<void> dialogbox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Make a Choice'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      openCamera(context);
                    },
                    child: Text('Camera'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      openGallery(context);
                    },
                    child: Text('Gallery'),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future openCamera(BuildContext context) async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
    Navigator.of(context).pop();
  }

  Future openGallery(BuildContext context) async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
    Navigator.of(context).pop();
  }

  void getlatlong() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    var lat = position.latitude;
    var lon = position.longitude;
    getLocation(lat, lon);
  }

  void getLocation(var lat, var lon) async {
    String key = 'cb637213988f5a2be2e59b9406aba75d';
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$key';
    http.Response response = await http.get(url);
    String data = response.body;
    var decodedData = jsonDecode(data);
    setState(() {
      String city = decodedData['name'];
      String Country = decodedData['sys']['country'];
      location = '$city,$Country';
    });
  }

  Widget datachecker() {
    if (location == null)
      return Text(
        'Loading data...',
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 17.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
    else
      return Text(
        location,
        style: TextStyle(
          fontFamily: 'Pacifico',
          fontSize: 17.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      );
  }

  void updateUI(String string) {
    setState(() {
      location = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'images/logo.png',
                      height: 40,
                    ),
                    Text(
                      'User Detail',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Name', hintStyle: kHintStyle),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    Address = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Address', hintStyle: kHintStyle),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    datachecker(),
                    RaisedButton(
                        splashColor: Colors.lightBlueAccent,
                        color: Colors.white30,
                        elevation: 5.0,
                        child: Text('Map'),
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MapsUp();
                              },
                            ),
                          );
                          updateUI(typedName);
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Fav-Colour :    ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                    DropdownButton<String>(
                      value: favCol,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Green',
                          ),
                          value: 'Green',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Yellow',
                          ),
                          value: 'Yellow',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Blue',
                          ),
                          value: 'Blue',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Red',
                          ),
                          value: 'Red',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Orange',
                          ),
                          value: 'Orange',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Purple',
                          ),
                          value: 'Purple',
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Black',
                          ),
                          value: 'Black',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          favCol = value;
                        });
                      },
                    ),
                  ],
                ),
                TextField(
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    Hobby = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintStyle: kHintStyle,
                    hintText: 'Hobby',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Choose Image :   ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900),
                    ),
                    RaisedButton(
                      elevation: 5.0,
                      splashColor: Colors.lightBlueAccent,
                      color: Colors.white30,
                      child: Text('Image'),
                      onPressed: () {
                        dialogbox(context);
                      },
                    ),
                  ],
                ),
                RoundedButton(
                  str: 'Submit',
                  onpress: () async {
                    var add = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LastPage(
                                  name: name,
                                  address: Address,
                                  data: _image,
                                  color: favCol,
                                  hobby: Hobby,
                                  loc: location,
                                )));
                    print(add);
                  },
                  Colour: Color(0xFF00796b),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
