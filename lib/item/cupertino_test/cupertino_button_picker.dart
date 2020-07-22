import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class cupertino_button_picker extends StatefulWidget {

  @override
  _cupertino_button_picker createState() => _cupertino_button_picker();
}

class _cupertino_button_picker extends State<cupertino_button_picker> {
  var _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("cupertino design"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoSwitch(
              value: _isOn,
            ),
            CupertinoButton(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.orange,
              child: Text(' 쿠퍼티노 버튼 '),
              onPressed: () {
                _showCupertinoDialog();
              },
            ),
            CupertinoButton(
              child: Text(" 쿠퍼티노 픽커"),
              onPressed: () {
                _showCupertinoPicker();
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _showCupertinoDialog() {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
                title: Text('제목'),
                content: Text("내용"),
                actions: <Widget>[
                  CupertinoDialogAction(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  CupertinoDialogAction(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ]));
  }

  _showCupertinoPicker() async {
    final _items = List.generate(10, (i) => i);
    var result = _items[0];

    await showCupertinoModalPopup(
        context: context,
        builder: (context) => Container(
            height: 200.0,
            child: CupertinoPicker(
                children: _items.map((e) => Text('No. $e')).toList(),
                itemExtent: 50.0,
                onSelectedItemChanged: (int value) {
                  result = _items[value];
                })));
    print(result);
  }
}
