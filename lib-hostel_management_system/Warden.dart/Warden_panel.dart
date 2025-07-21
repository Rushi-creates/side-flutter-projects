import 'package:flutter/material.dart';
import 'package:hostel_management_system/screens/Profile.dart';
import 'package:hostel_management_system/screens/ViewAllStudents.dart';
import 'package:hostel_management_system/screens/ViewAttendance.dart';
import 'package:hostel_management_system/screens/ViewMessFood.dart';
import 'package:hostel_management_system/screens/ViewRooms.dart';

//to change class name = right click on className> Rename symbol
class WardenPanel extends StatefulWidget {
  const WardenPanel({Key? key}) : super(key: key);

  @override
  _WardenPanelState createState() => _WardenPanelState();
}

class _WardenPanelState extends State<WardenPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: wardenHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // viewAttendanceCard(),
              viewMessFoodCard(),
              viewAttendanceCard(),
              viewStudentsCard(),
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
                      "View Or Edit Attendance",
                      maxLines: 1,
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
                      "View Or Edit Hostel Rooms",
                      maxLines: 1,
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
                      maxLines: 1,
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
                      "View Or Edit Mess Food",
                      maxLines: 1,
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

  AppBar wardenHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,

      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "Warden Panel", //give here appBar title
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
