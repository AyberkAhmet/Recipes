import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Card(
          margin: EdgeInsets.all(30.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(30, 30))),
          child: TextField(
            style: TextStyle(color: Colors.orange),
            decoration: InputDecoration(
                hintText: "Tarif Ara", icon: Icon(Icons.search)),
          ),
        ));
  }
  
}