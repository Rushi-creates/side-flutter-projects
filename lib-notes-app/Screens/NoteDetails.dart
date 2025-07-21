import 'package:flutter/material.dart';
import 'package:notes_app/models/rowModel.dart';
import 'package:notes_app/utils/database_helper.dart';
import 'package:notes_app/utils/dbHelper_trial.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({Key? key}) : super(key: key);

  @override
  _NoteDetailsState createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  DatabaseHelper _instance = DatabaseHelper() ;
  // DbHelper _dbHelperObj = DbHelper() ;
  RowModel rowModelObj = RowModel.namedConst();

  TextEditingController titleControllerObj = TextEditingController() ;
  TextEditingController subTitleControllerObj = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: null,),
        title: Text('About this note'),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.more_vert))],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: null,
        elevation: 7,
        child: IconButton(icon: Icon(Icons.subdirectory_arrow_right),
          onPressed: null,
      ),
    ) ,


      body:Center(
        child: Column(
          children: [
            TextField(
              controller: titleControllerObj,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "add note title here",
                labelText: "Title"
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: subTitleControllerObj,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintText: "add body of your note here",
                  labelText: "Description" ),
            ) ,
            SizedBox(height: 20,),


            ElevatedButton( child: Text("Save/Insert") ,
              onPressed: (){
                _instance.saveUser( rowModelObj ) ;
                // _dbHelperObj.insertRow( rowModelObj ) ;
              setState(() {
                 RowModel.namedConst().title = (titleControllerObj.text).toString() ;
                var store2 = subTitleControllerObj ;

              });
              },
            ) ,


            ElevatedButton( child: Text("Delete") ,
              onPressed: (){
                setState(() {
                  _instance.deleteUser(rowModelObj) ;
                  var store1 = titleControllerObj ;
                });
              },
            ),


            ElevatedButton( child: Text("Update") ,
              onPressed: (){
                setState(() {
                  var store1 = titleControllerObj ;
                });
              },
            )

          ],
        ),
      )


    ) ;
  }
}
