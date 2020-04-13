import 'package:flutter/material.dart';
import 'package:tarifler/screens/Home.dart';
import 'package:tarifler/screens/malzemelerleAra.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State {
  var appBartitle = "Yemek Tarifleri";
  int _selectedPage = 0;
  final _pageOption = [
    Home(),
    MalzemelerleAra()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBartitle),
        centerTitle: true,
      ),
      body: _pageOption[_selectedPage],
      bottomNavigationBar:
          BottomNavigationBar(
            currentIndex: _selectedPage,
            onTap: (int index){
              setState(() {
               _selectedPage = index;
               if (_selectedPage == 0) {
                 appBartitle = "Yemek Tarifleri";
               }
               else if (_selectedPage == 1) {
                 appBartitle = "Malzemelerle Ara";
               }
              });
            },
            backgroundColor: Colors.blue, items: [
        BottomNavigationBarItem(
            title: Text(
              "Home",
              style: TextStyle(color: Colors.black),
            ),
            icon: Icon(Icons.home, color: Colors.black)),
        BottomNavigationBarItem(
            title:
                Text("Malzemelerle Ara", style: TextStyle(color: Colors.black)),
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ))
      ]),
    );
  }






}

