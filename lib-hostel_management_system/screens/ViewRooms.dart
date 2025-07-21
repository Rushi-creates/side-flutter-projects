import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hostel_management_system/global.dart';
import 'package:hostel_management_system/new%20api%20trial/create&UpdateForm.dart';
import 'package:hostel_management_system/new%20api%20trial/employee_model.dart';
import 'package:hostel_management_system/new%20api%20trial/newApiHelper.dart';
import 'package:hostel_management_system/new%20api%20trial/newGLobal.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

//to change class name = right click on className> Rename symbol
class ViewRooms extends StatefulWidget {
  const ViewRooms({Key? key}) : super(key: key);

  @override
  _ViewRoomsState createState() => _ViewRoomsState();
}

class _ViewRoomsState extends State<ViewRooms> {
  Client client = http.Client();

  myDeleteApi(urlArg, modelObjArg) async {
    await client.delete(
      Uri.parse(urlArg + modelObjArg.toString() + "/"),
    );

    print(Uri.parse(urlArg + modelObjArg.toString() + "/"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purple,
          // tooltip: "Hint text on hover ",
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return createOrUpdateEmployee();
            }));
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              fetch_api_collection_myStudents(),
            ],
          ),
        ));
  }

  fetch_api_collection_myStudents() {
/* -------------------------------------------------------------------------- */
/*        //! Fetching any collection , whose path we mention below as req    */
/*           //! Displaying fetch Collection using ListView.builder           */
/*     //? inside scaffold's body prop , or wherever we want to display       */
/* -------------------------------------------------------------------------- */

    return FutureBuilder(

        //Todo: pass here the fetching url string var stored in global.dart
        future: client.get(Uri.parse(getPosts)),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            Center(child: Text("Something went wrong: ${snapshot.error}"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data == null) {
            return Text("No data yet");
          }
          /* -------------------------------------------------------------------------------------- */
          /* //!  if data is fetched properly, then store it in docsListName (1 doc = 1 docListName)*/
          /* -------------------------------------------------------------------------------------- */
          List<Note> myNewList = [];

          if (snapshot.data.statusCode == 200) {
            print('status code 200');
            List storeResponse = json.decode(snapshot.data.body);
            storeResponse.forEach((element) {
              myNewList.add(Note.fromMap(element));
            });
            // setState(() {});
          } else {
            print('response not fetched - status code != 200');
            throw Exception('Failed to load album');
          }

          /* -------------------------------------------------------------------------- */
          /*  //? displaying all key-values , from docNameList , using ListView.builder */
          /* -------------------------------------------------------------------------- */

          //Todo: change UI here , and display data as req
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: myNewList.length,
            itemBuilder: (context, i) {
              return ListTile(
                //Todo: paste the KEY names ( in 'string') , from firestore documents
                title: Text(myNewList[i].body),
                subtitle: Text(myNewList[i].id.toString()),
                onTap: null,
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    await EmployeeAPi.apiHelperObj
                        .deleteEmployee(getPosts, myNewList[i].id);
                  },
                ),
              );
            },
          );
        });
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "View Rooms", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: IconButton(
      //         onPressed: null,
      //         icon: Icon(
      //           Icons.search,
      //           color: Colors.black,
      //         )),
      //   )
      // ],
    );
  }
}
