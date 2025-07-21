import 'package:flutter/material.dart';
import 'package:whatsapp_clone/model/chatListModel.dart';

import 'Core_chat_page.dart';

class ChatListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChatListState();
  }
}

class ChatListState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) => new Column(
        children: <Widget>[
          new ListTile(
              leading: new CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: new NetworkImage(dummyData[i].avatarUrl),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    dummyData[i].name,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    dummyData[i].time,
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  dummyData[i].message,
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
              onTap: () {
                final varName1 = SnackBar(
                  content: Text("${dummyData[i].name} is tapped "),
                  action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () => null,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(varName1);

                zooCommonPage(dummyData[i].name ,dummyData[i].avatarUrl) ;
              }),
          new Divider(
            height: 4.0,
          )
        ],
      ),
    );
  }
  void zooCommonPage(argName ,argName2){
    Navigator.push(context, MaterialPageRoute (builder: (context){
      return ChatCorePage.named(argName , argName2) ;
    }

    ) ) ;
  }









}
