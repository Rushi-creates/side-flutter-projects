import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StatusState();
  }
}

class StatusState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Status screen code here"),
    ) ;
  }
}