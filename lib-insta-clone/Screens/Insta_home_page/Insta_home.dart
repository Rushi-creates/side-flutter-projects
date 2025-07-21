import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/home_body_List_model.dart';

import '../common_page.dart';
import 'home_body_list.dart';
import 'home_list.dart';
import 'home_stories.dart';

class InstaHome extends StatefulWidget {
  const InstaHome({Key? key}) : super(key: key);

  @override
  _InstaHomeState createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        leading: Icon(Icons.camera_alt),
        title: Text("INSTAGRAM"),
        centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.messenger_outlined),
        )],
      ),




      body:ListView(
        children: [
          Container(
            height: deviceHeight.height * 0.13,
            child: HomeStories(),
          ),
          Expanded(child: HomeBodyList())
        ],
      ),




      bottomNavigationBar: zooBottomBar(),
    );
  }

  //bottom app just stored in a custom core function
  Widget zooBottomBar(){
    return Container(
      color: Colors.white,
      height: 50.0,
      alignment: Alignment.center,
      child: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,18.0,0.0,9.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  child: Icon(Icons.home),
                  onTap: () => InstaHome()),
              GestureDetector(
                  child: Icon(Icons.search),
                  onTap: () => homeToCommon("Explore")),

              GestureDetector(
                  child: Icon(Icons.add_box_outlined),
                  onTap: () => homeToCommon("Post")),

              GestureDetector(
                  child: Icon(Icons.favorite),
                  onTap: () => homeToCommon("Notifications")),
              GestureDetector(
                  child: Icon(Icons.person),
                  onTap: () => homeToCommon("Profile")),
            ],
          ),
        ),
      ),
    ) ;
  }

  void homeToCommon(arg1) {
    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) {
  return CommonPage.named( arg1);
  }),
  ) ;
}
}
