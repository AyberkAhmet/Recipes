import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Constants {
  List<dynamic> malzemeler;
  DocumentReference reference;
  Constants (){}

  Constants.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["malzemeler"] != null),
        malzemeler = map["malzemeler"];

  Constants.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}

class GetMalzemeler extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GetMalzemelerState();
}

class GetMalzemelerState extends State {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("malzemeler").snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data.documents.length > 0) {
        
          final getMalzemeler = Constants.fromSnapshot(snapshot.data.documents.elementAt(0));
          print(getMalzemeler.malzemeler);
          return Text("example");
        }
        else{
          return LinearProgressIndicator();
        }
      },
    );
    
  }


}
