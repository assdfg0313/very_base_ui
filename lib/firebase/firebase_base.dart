import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// it would be error!! so we need to change the versoin!!
// android/app/build.gradle : minSdkVersion 16 -> minSdkVersion 21

/* also other error

 [Firestore]: Listen for Query(... order by __name__) failed:
 PERMISSION_DENIED: Missing or insufficient permissions.

 because firestore <= Production Mode (not testing mode)
 change rules at firebase console
 in this case it was datetime was 2020.03.20
*/


class Todo {
  bool isDone;
  String title;

  Todo(this.title, {this.isDone = false});
}

class firebase_base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 관리',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: fbBase(),
    );
  }
}

class fbBase extends StatefulWidget {
  @override
  _fbBaseState createState() => _fbBaseState();
}

class _fbBaseState extends State<fbBase> {
  // final _items = <Todo>[];

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
              ),
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('todo').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData){
                    print("not data");
                    return CircularProgressIndicator();
                  }
                  final documents = snapshot.data.documents;
                  return Expanded(
                    child: ListView(
                      children: documents.map((doc)=> _buildItemWidget(doc)).toList(),
                    ),
                  );
                }
              ),
            ],
          ),
        ));
  }

  Widget _buildItemWidget(DocumentSnapshot doc){

    final todo = Todo(doc['title'], isDone: doc['isDone']);

    return ListTile(
      onTap: () => _toggleTodo(doc),
      title: Text(todo.title, style: todo.isDone? TextStyle(decoration: TextDecoration.lineThrough, fontStyle: FontStyle.italic):null),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: ()=> _deletetTodo(doc),
      ),
    );
  }
  
  void _addTodo(Todo todo){
    Firestore.instance.collection('todo').add({'title': todo.title, 'isDone': todo.isDone});
    _todoController.text = '';
  }

  void _deletetTodo(DocumentSnapshot doc){
    Firestore.instance.collection('todo').document(doc.documentID).delete();
  }

  void _toggleTodo(DocumentSnapshot doc){
    Firestore.instance.collection('todo').document(doc.documentID).updateData({'isDone': !doc['isDone']});
  }
}
