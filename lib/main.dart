import 'package:flutter/material.dart';
import 'package:very_base_ui/teayong/ty_folder.dart';
import 'image_animation_Test/image_folder.dart';
import 'item/cupertino_test/cupertino_folder.dart';
import 'jinho/jh_folder.dart';
import 'kanghyun/kh_folder.dart';
import 'kibaek/kb_folder.dart';

void main() {
  runApp(MyApp());
}

List<String> list = [
  '/image_folder',
  '/cupertino_folder',
  '/jh_folder',
  '/kh_folder',
  '/kb_folder',
  '/ty_folder',
];

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
          '/image_folder':(context) => image_folder(),
          '/cupertino_folder': (context) => cupertino_folder(),
          '/jh_folder': (context) => jh_folder(),
          '/kh_folder': (context) => kh_folder(),
          '/kb_folder': (context) => kb_folder(),
          '/ty_folder': (context) => ty_folder(),
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

  Widget folder_list(String title) {
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
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("total contents")),
      body: Center(
        child: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list.map((folder)=>folder_list(folder)).toList(),
            ),
        ),
      ),
    );
  }
}
