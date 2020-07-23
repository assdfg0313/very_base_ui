import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// it's different between ^4.3.1 vs ^3.0.0
// need to add provider at pubspec.yaml
// there are 2 ways to get data from provider
// 1. wrap widget with Consumer<Counter>     : always get
// 2. using Provider.of<Counter>(context)    : get select (listen)

// context must same level (2 case)

import 'Counter.dart';



class provider_example1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo Provider',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ChangeNotifierProvider(
            builder: (context) => Counter(),
            child: MyHomePage_provider(title: 'Flutter example provider')),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<Counter>(
              builder: (context, value, child) => Text(
                value.getCount().toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<Counter>(context, listen: false).increament(), // button not need to change
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}