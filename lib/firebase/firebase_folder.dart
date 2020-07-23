import 'package:flutter/material.dart';

import 'firebase_base.dart';
import 'firebase_base_not.dart';


List<List<String>> list = [
  ['/firebase_base',"200723","강현"],
  ['/firebase_base_not',"200723","강현"],
];

class firebase_folder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'folder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: fbFolder(),
        routes: {
          '/firebase_base':(context) => firebase_base(),
          '/firebase_base_not':(context) => firebase_base_not(),
        }
    );
  }
}

class fbFolder extends StatefulWidget {
  @override
  _fbFolderState createState() => _fbFolderState();
}

class _fbFolderState extends State<fbFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("파이어베이스")),
      body: Center(
        child: SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: list.map((elem)=> content_list(elem[0],elem[1],elem[2])).toList(),
          ),
        ),
      ),
    );
  }

  Widget content_list(String title, String date, String name) {
    return GestureDetector(
      onTap:(){Navigator.pushNamed((context), title);},
      child: SizedBox(
        height: 80,
        width: 300,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.red, width:1),),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, textAlign: TextAlign.center,),
              Text("최근 수정 날짜 : $date", style: TextStyle(color: Colors.grey, fontSize: 10),),
              Text("수정한 사람 : $name", style: TextStyle(color: Colors.grey, fontSize: 10),),
            ],
          ),
        ),
      ),
    );
  }
}
