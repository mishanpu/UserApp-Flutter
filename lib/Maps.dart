import 'dart:async';
import 'dart:convert';
import 'package:flashchat/Network.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flashchat/Detail.dart';
import 'package:http/http.dart' as http;
import 'package:flashchat/Component/Rounded_Button.dart';

class MapsUp extends StatefulWidget {
  @override
  _MapsUpState createState() => _MapsUpState();
}

class _MapsUpState extends State<MapsUp> {
  List<Marker> allMarker = [
    Marker(
        markerId: MarkerId('MyMarker'),
        draggable: true,
        onTap: () {
          print('tapped');
        },
        position: LatLng(20.5937, 78.9629))
  ];
  @override
  void initstate() {
    super.initState();
  }

  update(LatLng pos) async {
    var lon = pos.longitude;
    var lat = pos.latitude;
    String key = 'cb637213988f5a2be2e59b9406aba75d';
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$key';
    http.Response response = await http.get(url);
    String data = response.body;
    var decodedData = jsonDecode(data);
    var city = decodedData['name'];
    var Country = decodedData['sys']['country'];

    setState(() {
      Addresss = '$city,$Country';
    });

    print(Addresss);
  }

  void handleTap(LatLng pos) {
    setState(() {
      allMarker = [];
      allMarker.add(Marker(markerId: MarkerId(pos.toString()), position: pos));
    });
    update(pos);
  }

  GoogleMapController _controller;
  String Addresss = 'Try Again(wait)';
  final CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(20.5937, 78.9629), zoom: 5.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: _cameraPosition,
            markers: Set.from(allMarker),
            mapType: MapType.normal,
            onMapCreated: (controller) {
              setState(() {
                _controller = controller;
              });
            },
            onTap: handleTap,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 60, 30, 30),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context, Addresss);
                    },
                    child: Text('Done'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
