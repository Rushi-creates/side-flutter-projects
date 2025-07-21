import 'package:flutter/material.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text("This is first trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is second trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is third trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fourth trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fifth trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fifth trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fifth trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fifth trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fifth trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fifth trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fifth trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fifth trial tile small list "),
        ) ,
        ListTile(
          title: Text("This is fifth trial tile small list "),
        ) , ListTile(
          title: Text("This is fifth trial tile small list "),
        ) ,





      ],

    );
  }
}
