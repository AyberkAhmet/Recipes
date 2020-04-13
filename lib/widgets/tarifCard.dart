import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tarifler/utilities/YemekTarifleri.dart';

class TarifCard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => TarifCardState();
    
  }
  
  class TarifCardState extends State{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("tarifler").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          return Column(
            children: snapshot.data.documents
                .map<Widget>((data) => _buildTarifListCard(context, data)) //buraya bir şey basmaya çalışıyor ama asagıdan bir şey dönmüyor
                .toList(),
          );
        }
      },
    );
  }

  _buildTarifListCard(BuildContext context, DocumentSnapshot data) {
    final yemekTarifi = YemekTarifleri.fromSnapshot(data);
    return Card(
        child: InkWell(
      highlightColor: Colors.blue,
      onTap: () {},
      child: Column(
        children: <Widget>[
          Text(
            yemekTarifi.isim,
            style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 300.0,
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.ac_unit),
              Text(yemekTarifi.tarif),
            ],
          )
        ],
      ),
    ));
  }
}