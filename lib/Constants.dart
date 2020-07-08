import 'package:flutter/material.dart';

const Ktext =
    TextStyle(color: Colors.teal, fontSize: 50, fontWeight: FontWeight.w900);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const kHintStyle = TextStyle(color: Colors.blueGrey);
const Klabel = TextStyle(
  color: Colors.black,
  fontSize: 25.0,
);
