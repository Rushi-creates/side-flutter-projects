import 'package:flutter/material.dart';
import 'Screens/Insta_home_page/Insta_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram by Rushi ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
        primaryIconTheme: IconThemeData(
            color: Colors.black),
      ),
      home: InstaHome(),
    );
  }
}

