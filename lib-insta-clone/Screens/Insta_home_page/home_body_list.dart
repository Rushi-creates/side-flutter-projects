import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_clone/models/home_body_List_model.dart';

class HomeBodyList extends StatefulWidget {
  const HomeBodyList({Key? key}) : super(key: key);

  @override
  _HomeBodyListState createState() => _HomeBodyListState();
}

class _HomeBodyListState extends State<HomeBodyList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: dummyList.length,
        itemBuilder: (context, i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min ,
            children: [
              //ROW1 - for profImg , name , and options
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(12.0,8.0,8.0,8.0),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(dummyList[i].profImg),
                              foregroundColor: Colors.grey,
                              backgroundColor: Colors.black,
                            ),
                          ) ,


                          Text(dummyList[i].profName , style: TextStyle(
                            fontWeight: FontWeight.bold ,
                          ),)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,8.0),
                        child: Icon(Icons.more_vert),
                      ),
                    ]),

              //2 row main image
              SizedBox(
                height: 400,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: NetworkImage(dummyList[i].mainImgURL),
                        fit: BoxFit.fill),
                  ),
                ),
              ),

              //3 row - like , share , comment and save
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0,12.0,8.0,8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.favorite ,color: Colors.red ,),
                      SizedBox(width: 15.0,),
                      Icon(Icons.mode_comment_outlined),
                      SizedBox(width: 15.0,),
                      Icon(FontAwesomeIcons.paperPlane ),
                      SizedBox(width: 15.0,),
                    ],
                  ),
                  Icon(Icons.bookmark_border)
                ]),
              ),

              //4 row - for like nums
              Padding(
                padding:const EdgeInsets.fromLTRB(15.0,2.0,8.0,0.0),
                child: Text("liked by ${dummyList[i].profName} and 653,832 others " ,
                    style : TextStyle(
                      fontWeight: FontWeight.bold ,
                )),
              ),

              //5 row for owner's caption
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0,0.0,8.0,0.0),
                    child:
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Add a comment...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                  ),


              //6 row - for posted time ( 3 minutes ago )
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0,0.0,8.0,0.0),
                child: Text("${dummyList[i].postedAgo} minutes ago " ,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,

                ), ),
              ) ,

              //spacing between 2 posts
              SizedBox(
                height: 20 ,
              )
            ],
          );
        });
  }

}
