import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onpress;
  final String str;
  final Color Colour;
  RoundedButton({this.onpress, this.str, this.Colour});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
          color: Colour,
          elevation: 6.0,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onpress,
            minWidth: 200.0,
            height: 40.0,
            child: Text(str),
          )),
    );
  }
}
