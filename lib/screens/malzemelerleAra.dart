import 'package:flutter/material.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:tarifler/utilities/constants.dart';

class MalzemelerleAra extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MalzemelerleAraState();
}

int _count = 0;

class _MalzemelerleAraState extends State {
  @override
  Widget build(BuildContext context) {
    List<Widget> extractedChildren = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GetMalzemeler(),
          FlatButton(
            color: Colors.green,
            onPressed: () => _changeListCount(true),
            child: Icon(Icons.add),
          ),
          FlatButton(
            color: Colors.red,
            onPressed: () => _changeListCount(false),
            child: Icon(Icons.remove),
          ),
        ],
      ),
      _malzemeAlani(),
    ];
    for (var i = 0; i < _count; ++i) {
      extractedChildren.add(_malzemeAlani());
    }

    return Container(
      child: ListView(
        children: extractedChildren,
      ),
    );
  }

  _malzemeAlani() {
    String malzeme_id;
    Constants constt = new Constants();
    List<String> malzemeler;
    if (constt.malzemeler == null) {
      malzemeler = ["example"];
    }
    else{
      malzemeler = constt.malzemeler;
    }
    return DropDownField(
      onValueChanged: (dynamic value) {
        malzeme_id = value;
      },
      value: malzeme_id,
      required: false,
      hintText: "Malzeme Seç",
      labelText: "Malzemeler",
      items: malzemeler,
    );
  }

  _changeListCount(bool value) {
    setState(() {
      if (value) {
        _count++;
      } else if (!value) {
        _count--;
      }
    });
  }
}
