import 'package:flutter/material.dart';
import 'package:hostel_management_system/screens/QR_scanner.dart';

//to change class name = right click on className> Rename symbol
class UserAttendanceScreen extends StatefulWidget {
  const UserAttendanceScreen({Key? key}) : super(key: key);

  @override
  _UserAttendanceScreenState createState() => _UserAttendanceScreenState();
}

class _UserAttendanceScreenState extends State<UserAttendanceScreen> {
  bool isCheckedin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            attendanceBodyCard(),
          ],
        ));
  }

  attendanceCard() {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: dimVar.height * 0.02, //(0.04/screen height)
                ),
                Text(
                  "Student attendance",
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[600],
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: dimVar.height * 0.02, //(0.04/screen height)
                ),
                TextButton(
                  child: Text(
                    "  Check in  ",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isCheckedin ? Colors.grey : Colors.pink[600]),
                  onPressed: () {
                    // write here actual code of checking-out
                  },
                ),
                SizedBox(
                  height: dimVar.height * 0.02, //(0.04/screen height)
                ),
                TextButton(
                    child: Text(
                      "Check Out ",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor:
                            isCheckedin ? Colors.pink[600] : Colors.grey),
                    onPressed: () {} //Make sure this is a part of scaffold
                    ),
                SizedBox(
                  height: dimVar.height * 0.04, //(0.04/screen height)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  attendanceBodyCard() {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: dimVar.height * 0.02, //(0.04/screen height)
            ),
            Text(
              "Student Attendance",
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.grey[600],
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 28.0,
              ),
            ),
            SizedBox(
              height: dimVar.height * 0.02, //(0.04/screen height)
            ),
            checkInCard(),
            checkOutCard()
          ],
        ),
      ),
    );
  }

  checkInCard() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        isCheckedin
            ? ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("You need to check-out first"),
                  action: SnackBarAction(
                    //this is for UNDO button
                    label: "Undo",
                    onPressed: () {
                      return null;
                    },
                  ),
                ),
              )
            : setState(() {
                isCheckedin = true;

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QR_attendance();
                }));

                QR_attendance();
              });
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: dimVar.height * 0.09,
          width: dimVar.width,
          child: Card(
            elevation: 10,
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  gradient: isCheckedin
                      ? LinearGradient(colors: [
                          Colors.grey.shade600,
                          Colors.grey,
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                      : LinearGradient(
                          colors: [
                              Colors.red,
                              Colors.purpleAccent,
                            ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20, 8.0, 1),
                    child: Text(
                      "Check in ",
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

  checkOutCard() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        isCheckedin
            ? setState(() {
                isCheckedin = false;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QR_attendance();
                }));
              }) // write here actual code of checking-out
            : ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("You need to check-in first"),
                  action: SnackBarAction(
                    //this is for UNDO button
                    label: "Undo",
                    onPressed: () {
                      return null;
                    },
                  ),
                ),
              );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: dimVar.height * 0.09,
          width: dimVar.width,
          child: Card(
            elevation: 10,
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  gradient: isCheckedin
                      ? LinearGradient(colors: [
                          Colors.red,
                          Colors.purpleAccent,
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                      : LinearGradient(
                          colors: [
                              Colors.grey.shade600,
                              Colors.grey,
                            ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20, 8.0, 1),
                    child: Text(
                      "Check Out ",
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

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "Attendance", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }
}
