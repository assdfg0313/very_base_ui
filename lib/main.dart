import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'image_animation_Test/animated_container.dart';
import 'item/cupertino_test/cupertino_button_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter very first base'),
        routes: {
          '/animiated_container':(context) => animated_container(),
          '/cupertino_button_picker': (context) => cupertino_button_picker(),
        }
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _size = 100.0;
  var _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("total contents")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(onTap:(){Navigator.pushNamed((context), '/animiated_container');},child: Text("image animation", textAlign: TextAlign.center,)),
            GestureDetector(onTap:(){Navigator.pushNamed((context), '/cupertino_button_picker');},child: Text("cupertino design", textAlign: TextAlign.center,)),
          ],
        ),
      ),
    );
  }
}
