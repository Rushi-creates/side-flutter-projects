import 'package:flutter/material.dart';
import 'package:hostel_management_system/screens/QR_codeBox.dart';
import '../screens/Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

//to change class name = right click on className> Rename symbol
class ViewAttendance extends StatefulWidget {
  const ViewAttendance({Key? key}) : super(key: key);

  @override
  _ViewAttendanceState createState() => _ViewAttendanceState();
}

class _ViewAttendanceState extends State<ViewAttendance> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  // bool isDateEntered = true;
  DateTime pickedNewValue = DateTime.now();

  DateTime myDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: adminHeader(),
        // floatingActionButton: myFab(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              showChoosenDate(),
              pickDateCard(),
              Divider(),
              fetchStreamCollec_allTimeAttendance()
              // myCupertinoDatePicker(),
              // isDateEntered
              //     ? fetchStreamCollec_allTimeAttendance()
              //     : Container(),
            ],
          ),
        ));
  }

  showChoosenDate() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Selected date : ${myDate.day} / ${myDate.month} / ${myDate.year}',
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 20.0,
              ),
            )),
      ),
    );
  }

  pickDateCard() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        DateTime? myNewDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2200));

        if (myNewDate == null) return;
        setState(() {
          // isDateEntered = true;
          myDate = myNewDate;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          // height: dimVar.height * 0.08,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15, 8.0, 15),
                    child: Text(
                      "Pick a date from here",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 17.0,
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

  myCupertinoDatePicker() {
    return Container(
      height: 200,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime(2022, 1, 15),
        onDateTimeChanged: (DateTime newDateTime) {
          // Do something
          setState(() {
            print('rebuilded');
            // isDateEntered = true;
            pickedNewValue = newDateTime;
          });
        },
      ),
    );
  }

//!change this funcsName
  fetchStreamCollec_allTimeAttendance() {
    return StreamBuilder<QuerySnapshot>(
        //Todo: pass here the 'whole' fetching path of 'collection' from firebase
        stream: FirebaseFirestore.instance
            .collection('Attendance')
            .doc("Month - ${DateTime.now().month.toString()}")
            // .collection("Date - ${dateController.text.trim()}")
            // .collection("Date - ${pickedNewValue.day.toString()}")
            .collection("Date - ${myDate.day.toString()}")

            //here i use the datecontroller, where user enters the date,instead of todays date
            .where("isPresent", isEqualTo: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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

          final List docsListName = [];

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            docsListName.add(a);

            /* -------------------------------------------------------------------------- */
            /*    //! storing name/id of document , inside its own doc body , as a key    */
            /* -------------------------------------------------------------------------- */
            //this 'idKEY' string is imp , use it as actual arg, to pass in delete,update crud
            a['idKEY'] = document.id;
          }).toList();

          //write any other req logic here to manipulate docsListName , before displaying

          /* -------------------------------------------------------------------------- */
          /*  //? displaying all key-values , from docNameList , using ListView.builder */
          /* -------------------------------------------------------------------------- */

          //Todo: change UI here , and display data as req
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: docsListName.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  //Todo: paste the KEY names (in 'string') ,from firestore documents
                  title: Text(docsListName[i]['userName']),
                  subtitle: Text(docsListName[i]['userEmail']),
                  onTap: () {},
                ),
              );
            },
          );
        });
  }

  // myFab() {
  //   return FloatingActionButton(
  //     child: Icon(Icons.add),
  //     backgroundColor: Colors.purple,

  //     // tooltip: "Hint text on hover ",
  //     onPressed: () {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
  //         return AddMember();
  //       }));
  //     },
  //   );
  // }

  AppBar adminHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "View Attendance", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }
}
