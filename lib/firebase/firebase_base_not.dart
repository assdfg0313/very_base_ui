import 'package:flutter/material.dart';

class Todo {
  bool isDone;
  String title;

  Todo(this.title, {this.isDone = false});
}

class firebase_base_not extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 관리',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: fbBaseN(),
    );
  }
}

class fbBaseN extends StatefulWidget {
  @override
  _fbBaseNState createState() => _fbBaseNState();
}

class _fbBaseNState extends State<fbBaseN> {
  final _items = <Todo>[];

  var _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("firebase base example"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _todoController,
                    ),
                  ),
                  RaisedButton(
                    child: Text('추가'),
                    onPressed: () => _addTodo(Todo(_todoController.text)),
                  ),
                ],
              ),Expanded(
                    child: ListView(
                      children: _items.map((todo)=>_buildItemWidget(todo)).toList(),
                    ),
                  )
              ,
            ],
          ),
        ));
  }

  Widget _buildItemWidget(Todo todo){

    return ListTile(
      onTap: () => _toggleTodo(todo),
      title: Text(todo.title, style: todo.isDone? TextStyle(decoration: TextDecoration.lineThrough, fontStyle: FontStyle.italic):null),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: ()=> _deletetTodo(todo),
      ),
    );
  }
  
  void _addTodo(Todo todo){
    setState((){
      _items.add(todo);
      _todoController.text = '';
    });
  }

  void _deletetTodo(Todo todo){
    setState((){
      _items.remove(todo);
    });
  }

  void _toggleTodo(Todo todo){
    setState((){
      todo.isDone = !todo.isDone;
    });
  }
}
