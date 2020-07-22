import 'package:flutter/material.dart';
import 'dart:async';




class clock_test extends StatefulWidget {
  @override
  _clock_test createState() => _clock_test();
}

class _clock_test extends State<clock_test> {

  Timer _timer;

  var _time = 0;
  var _isRunning = false;

  List<String> _lapTimes = [];

  @override
  void dispose(){
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("clock 연습")
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> setState((){clickButton();}),
        child: _isRunning?Icon(Icons.pause):Icon(Icons.play_arrow),
          heroTag: 'a',  // we use Hero at image_animation (중복)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

  Widget _buildBody(){

    var sec = _time ~/ 100;
    var hundredth = '${_time % 100}'.padLeft(2,'0');

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top:30),
        child: Stack(
          children: <Widget>[
            Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('$sec', style: TextStyle(fontSize: 50.0)),
                  Text('$hundredth'),
                ],
              ),
              Container(
                width: 100,
                height: 200,
                child: ListView(
                  children: _lapTimes.map((time)=> Text(time)).toList(),
                )
              )
            ]
            ),
            Positioned(left:10, bottom:10, child: FloatingActionButton(
              backgroundColor: Colors.deepOrangeAccent,
              onPressed: _reset, // function 자체 가능
              child: Icon(Icons.rotate_left)
            )),
            Positioned(
              right: 10,
              bottom: 10,
              child: RaisedButton(
                onPressed: (){_recordLapTime('$sec.$hundredth');},
                child: Text('랩타임')
              ),
            ),
          ],
        )
      ),
    );
  }

  void clickButton(){
    _isRunning = !_isRunning;

    if(_isRunning){
      _start();
    }else{
      _pause();
    }
  }

  void _start(){
    _timer = Timer.periodic(Duration(microseconds: 10), (timer) { setState((){_time++;});});
  }

  void _pause(){
    _timer?.cancel();
  }

  void _reset() {
    setState((){
      _isRunning = false;
      _timer?.cancel();
      _lapTimes.clear();
      _time=0;
    });
  }

  void _recordLapTime(String time){
    _lapTimes.insert(0, '${_lapTimes.length + 1}등 $time');
  }
}
