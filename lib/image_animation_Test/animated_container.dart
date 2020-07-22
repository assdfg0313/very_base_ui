import 'package:flutter/material.dart';

class animated_container extends StatefulWidget {

  @override
  _animated_containerState createState() => _animated_containerState();
}

class _animated_containerState extends State<animated_container> {

  var _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("image animation")
      ),
      body: Center(
        child: GestureDetector(
            onLongPressStart: (a){
              setState((){_size = 200;});
              print(a);
              },
          onLongPressEnd: (a){
              setState((){_size = 100;});
              print(a);
          } ,
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>HeroDetailPage()),
            );
          },
          child: AnimatedContainer(
            duration: Duration(seconds:1),
            width: _size,
            height: _size,
            child: Hero(
              tag: 'image',
              child: Image.asset('images/earth.jpg', width: 100, height: 100,),
            ),
            curve: Curves.fastOutSlowIn,
          ),
        )
      ),

    );
  }
}


class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text('Hero Detail')),
        body: Hero(tag: 'image', child: Image.asset('images/earth.jpg')));
  }
}

