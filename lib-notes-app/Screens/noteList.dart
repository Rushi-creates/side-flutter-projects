import 'package:flutter/material.dart';
import 'NoteDetails.dart';


class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //change this count later 
     itemCount: 20 ,  
      itemBuilder: (context,index ){
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            //backgroundImage: NetworkImage(),
          ),
          title: Text( "here title stored in db table later"),
          subtitle:  Text(
            "Bring here desc/body of note stored in db table later",
            maxLines: 1,
            overflow: TextOverflow.ellipsis, ) ,
          trailing: IconButton(icon: Icon(Icons.more_vert),onPressed: null,),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return NoteDetails();
              }))
        ) ;
      },
    );
  }
}
