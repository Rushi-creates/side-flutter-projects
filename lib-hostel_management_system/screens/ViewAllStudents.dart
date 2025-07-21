import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hostel_management_system/global.dart';
import 'package:hostel_management_system/models/Student.dart';
import 'package:hostel_management_system/screens/Students_details.dart';
import 'package:hostel_management_system/screens/UpdateStudentDetails.dart';
import 'package:hostel_management_system/services/api.dart';
import 'package:hostel_management_system/services/firestoreDB.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

//to change class name = right click on className> Rename symbol
class ViewAllStudets extends StatefulWidget {
  const ViewAllStudets({Key? key}) : super(key: key);

  @override
  _ViewAllStudetsState createState() => _ViewAllStudetsState();
}

class _ViewAllStudetsState extends State<ViewAllStudets> {
  Client client = http.Client();

  fetch_api_collection_Students() {
    return FutureBuilder(

        //Todo: pass here the fetching url string var stored in global.dart
        future: client.get(Uri.parse(get_students)),
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
          List<StudentModel> myNewList = [];

          if (snapshot.data.statusCode == 200) {
            print('status code 200');
            List storeResponse = json.decode(snapshot.data.body);
            storeResponse.forEach((element) {
              myNewList.add(StudentModel.fromMap(element));
              print(element);
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
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.deepPurpleAccent,
                      Colors.lightBlueAccent,
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                    child: ListTile(
                      title: Text(myNewList[i].name!),
                      subtitle: Text(myNewList[i].email!),
                      trailing: CircleAvatar(
                        backgroundColor: Colors.white,
                        // backgroundImage: NetworkImage("url_here"),
                        // radius: 25.0,
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: const EdgeInsets.all(14.0),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            "Are you sure you want to remove this student"),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text("Delete"),
                                        onPressed: () async {
                                          await ApiHelper.apiHelperObj
                                              .newTrialDeleteApi(
                                                  myNewList[i].id);
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return StudentDetails.passSinglestudent(
                            singleStudent: myNewList[i],
                          );
                        }));
                      },
                      // leading: CircleAvatar(
                      //   backgroundColor: Colors.grey,
                      // ),
                      // trailing: IconButton(
                      //   icon: Icon(Icons.delete),
                      //   onPressed: () {
                      //     return null;
                      //   },
                      // ),
                      // tileColor: Colors.red,
                    ),
                  ),
                ),
              );
            },
          );
        });
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
          onPressed: () async {
            // await ApiHelper.apiHelperObj.addloginUser();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return UpdateStudetDetails();
            }));
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [fetch_api_collection_Students()],
          ),
        ));
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
        "View all students", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
        )
      ],
    );
  }
}
