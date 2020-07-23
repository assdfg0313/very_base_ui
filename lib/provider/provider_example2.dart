import 'package:flutter/material.dart';


// need to add provider at pubspec.yaml


class provider_example2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage_provider(title: 'Flutter example provider'),
    );
  }

}

class MyHomePage_provider extends StatelessWidget {

  MyHomePage_provider({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget _buildBody(BuildContext context) {
  return Center(
    child: Text("Not yet")
  );
}