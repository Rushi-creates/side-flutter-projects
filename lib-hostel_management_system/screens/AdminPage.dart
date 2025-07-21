import 'package:flutter/material.dart';
import 'package:hostel_management_system/screens/QR_codeBox.dart';
import 'package:hostel_management_system/screens/ViewAllStudents.dart';
import 'package:hostel_management_system/screens/ViewAttendance.dart';
import 'package:hostel_management_system/screens/ViewRooms.dart';
import 'package:hostel_management_system/screens/ViewMessFood.dart';
import '../screens/Profile.dart';

//to change class name = right click on className> Rename symbol
class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: adminHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // viewAttendanceCard(),
              viewStudentsCard(),
              viewAttendanceCard(),
              viewMessFoodCard(),
              viewRoomsCard(),
            ],
          ),
        ));
  }

  viewAttendanceCard() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ViewAttendance();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: dimVar.height * 0.25,
          width: dimVar.width,
          child: Card(
            elevation: 10,
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.purpleAccent,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20, 8.0, 1),
                    child: Text(
                      "View Attendance",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  viewRoomsCard() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ViewRooms();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: dimVar.height * 0.25,
          width: dimVar.width,
          child: Card(
            elevation: 10,
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.purpleAccent,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20, 8.0, 1),
                    child: Text(
                      "View Hostel Rooms",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  viewStudentsCard() {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: dimVar.height * 0.25,
        width: dimVar.width,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ViewAllStudets();
            }));
          },
          child: Card(
            elevation: 10,
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.red,
                Colors.purpleAccent,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20, 8.0, 1),
                    child: Text(
                      "View Hostel Students",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  viewMessFoodCard() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ViewMessFood();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: dimVar.height * 0.25,
          width: dimVar.width,
          child: Card(
            elevation: 10,
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.red,
                Colors.purpleAccent,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20, 8.0, 1),
                    child: Text(
                      "View Mess Food",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar adminHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      leading: IconButton(
        icon: Icon(
          Icons.qr_code_2_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return QR_codeBox();
          }));
        },
      ),

      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "Admin Panel", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Profile();
                }));
              }),
        )
      ],
    );
  }
}
