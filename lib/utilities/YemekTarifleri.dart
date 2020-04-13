import 'package:cloud_firestore/cloud_firestore.dart';

class YemekTarifleri {
  String isim;
  List malzemeler = [];
  String tarif;
  DocumentReference reference;

  YemekTarifleri.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map["isim"] != null),
        assert(map["malzemeler"] != null),
        assert(map["tarif"] != null),
        isim = map["isim"],
        malzemeler = map["malzemeler"],
        tarif = map["tarif"];

  YemekTarifleri.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}