
import 'package:flutter/material.dart';
import 'package:notes_app/Screens/noteList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes app by Rushi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryIconTheme: IconThemeData(color: Colors.white),
        accentColor: Colors.purple
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: null ,
          ),
          title: Text("Notes app by Rushi"),
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.search))
          ],
        ),
        body: NoteList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,),
      )
    );
  }
}
