import 'package:flutter/material.dart';

class text_field_test0 extends StatefulWidget {
  @override
  _text_field_test0State createState() => _text_field_test0State();
}

class _text_field_test0State extends State<text_field_test0> {

  final myController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  void initState(){
    super.initState();

    myController.addListener(_printLatestValue);
  }

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("두 번째 text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text input 연습")
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (text) {
                  print("첫 번째 text field: $text");
                },
              ),
              TextField(
                controller: myController,
              ),
              Text("form 텍스트", textAlign: TextAlign.center,),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      validator: (value){
                        if (value.isEmpty)
                          return '글자를 입력하세요';
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Builder(
                        builder: (ctx)=> RaisedButton(
                            onPressed: (){
                              if (_formKey.currentState.validate()){
                                Scaffold.of(ctx)
                                    .showSnackBar(SnackBar(content: Text('검증완료')));
                              }
                            }
                        ),
                      )
                    ),
                  ],
                ),
              ),

            ],
          )
      ),

    );
  }
}
