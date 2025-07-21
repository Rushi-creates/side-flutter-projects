import 'package:flutter/material.dart';
import 'Screens/CameraScreen.dart';
import 'Screens/ChatListScreen.dart';
import 'Screens/StatusScreen.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabControllerObj;

  @override
  void initState() {
    super.initState();
    _tabControllerObj = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    //this is the main chat screen scaffold
    return Scaffold(
      appBar: AppBar(
          title: Text("Whatsapp by Rushi"),
          elevation: 0.7,
          actions: <Widget>[Icon(Icons.search), Icon(Icons.more_vert)],
          bottom: TabBar(
            controller: _tabControllerObj,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.message,
            color: Colors.white,
          ),
          backgroundColor: Color(0xff00917C),
          onPressed: () {
            final varName2 = SnackBar(
              content:
                  Text("In Production-to create a new list item from here "),
              action: SnackBarAction(
                label: "UNDO",
                onPressed: () => null,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(varName2);
          }),
      body: TabBarView(
        controller: _tabControllerObj,
        children: <Widget>[CameraScreen(), ChatListScreen(), StatusScreen()],
      ),
    );
  }
}
