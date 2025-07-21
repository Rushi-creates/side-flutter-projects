import 'package:flutter/material.dart';

class ChatCorePage extends StatefulWidget {
  final String argName;

  final String argName2;

  const ChatCorePage(
      {Key? key, this.argName = "No name", this.argName2 = "no url"})
      : super(key: key);

  const ChatCorePage.named(this.argName, this.argName2);

  @override
  _ChatCorePageState createState() =>
      _ChatCorePageState(this.argName, this.argName2);
}

class _ChatCorePageState extends State<ChatCorePage> {
  final String argName;
  final String argName2;

  _ChatCorePageState(this.argName, this.argName2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 8.0, 8.0, 8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(argName2),
          ),
        ),
        title: Text(argName),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Stack(
        children: [
          Text("this is below bg image "),
          Container(
            child: Image.asset('assets/images/whatsappBg.png'),
          ),
          Center(
            child: Text("In production : Developed by - Rushi Patil",
          ),
          )
        ],
      ),
    );
  }
}
