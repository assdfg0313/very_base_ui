import 'package:flutter/material.dart';
import 'package:very_base_ui/provider/provider_example1.dart';
import 'package:very_base_ui/provider/provider_example2.dart';

List<List<String>> list = [
  ['/provider_example1',"200723","강현"],
  ['/provider_example2',"200723","강현"],
];

class provider_folder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'folder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: providerFolder(),
        routes: {
          '/provider_example1':(context) => provider_example1(),
          '/provider_example2':(context) => provider_example2(),
        }
    );
  }
}

class providerFolder extends StatefulWidget {
  @override
  _providerFolder createState() => _providerFolder();
}

class _providerFolder extends State<providerFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider")),
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
