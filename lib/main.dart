import 'package:flutter/material.dart';

// TUTORIAL TODO https://levelup.gitconnected.com/making-a-flutter-todo-app-from-scratch-part-1-bd66608b1818

void main() => runApp(MyApp()); // => one line function


List<String> items = ["Item 1", "Item 2", "Item 3"];

class MyApp extends StatelessWidget { // State can not change
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Make this a TodoApp',
      home: App(),
    );
  }
}

//created with stful

class App extends StatefulWidget{ // State can change
  @override
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar( // Header Bar
          title: Text("Header Bar"),
        ),
        body: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() { // re-draw screen if change
              if(oldIndex < newIndex){
                newIndex -= 1; // Hold index in temporary location
              }
              var getReplacedWidget = items.removeAt(oldIndex); // remove existing index
              items.insert(newIndex, getReplacedWidget); // insert new index

            });
          },
          children: <Widget>[
            // Take string from list and embed it into Text Widget
            for(final value in items)
              Text(
                value,
                key: Key(value),
                style: TextStyle(
                  fontSize: 22.0
                ),
              )
          ],


        ),

      );
    }
}



