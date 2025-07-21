import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/home_body_List_model.dart';

class HomeStories extends StatefulWidget {
  const HomeStories({Key? key}) : super(key: key);

  @override
  _HomeStoriesState createState() => _HomeStoriesState();
}

class _HomeStoriesState extends State<HomeStories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyList.length,
        itemBuilder: (context,i){
          return Padding(
            padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 33.0,
                    backgroundImage: NetworkImage(dummyList[i].profImg),
                    foregroundColor: Colors.grey,
                    backgroundColor: Colors.black,
                  ),
                  SizedBox(height: 2,) ,
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 80,
                      child: Text(dummyList[i].profName ,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),

          );
        }
      ),
    ) ;
  }
}
