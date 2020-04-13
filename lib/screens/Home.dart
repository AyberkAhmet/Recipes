import 'package:flutter/material.dart';
import 'package:tarifler/widgets/searchBox.dart';
import 'package:tarifler/widgets/tarifCard.dart';


class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HomeState();
    
  }
  
  class HomeState extends State {
  @override
  Widget build(BuildContext context) {

    return Container(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return SearchBox();
            } else {
              return TarifCard();
            }
          },
        ),
      );

      
  }
 



    


}


