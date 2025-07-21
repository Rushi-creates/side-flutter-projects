import 'package:flutter/material.dart';
import 'package:hostel_management_system/global.dart';
import 'package:hostel_management_system/screens/UpdateStudentDetails.dart';
import 'package:hostel_management_system/services/api.dart';

//to change class name = right click on className> Rename symbol
class StudentDetails extends StatefulWidget {
  final singleStudent;

  StudentDetails.passSinglestudent({this.singleStudent});
  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,

      appBar: myHeader(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.create),
        backgroundColor: Colors.purple,
        // tooltip: "Hint text on hover ",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UpdateStudetDetails.passSinglestudent(
                singleStudent: widget.singleStudent);
          }));
        },
      ),
      body: studentDetailCard(),
    );
  }

  studentDetailCard() {
    return Card(
      color: Colors.deepPurple[50],
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          buildSingleText('Name', widget.singleStudent.name),
          buildSingleText('email', widget.singleStudent.email),
          buildSingleText('address', widget.singleStudent.address),
          buildSingleText('Phone', widget.singleStudent.phone.toString()),
          buildSingleText('Room', widget.singleStudent.room_number.toString()),
          buildSingleText('Hostel Fees', widget.singleStudent.hostel_fees),
          buildSingleText('Mess Fes', widget.singleStudent.mess_fees),
          SizedBox(
            height: 20, //(0.04/screen height)
          ),
        ],
      ),
    );
  }

  buildSingleText(KeyNameArg, modelPropNameArg) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            KeyNameArg + ":  ",
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              // fontSize: 20.0,
            ),
          ),
          Text(
            modelPropNameArg,
            // maxLines: 2,
            // overflow: TextOverflow.ellipsis,
            // textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              // decoration: TextDecoration.none,
              // fontStyle: FontStyle.italic,
              // fontFamily: "FontNameHere" ,
              // fontWeight: FontWeight.bold,
              // fontWeight: FontWeight.w300,
              // fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
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
        widget.singleStudent.name, //give here appBar title
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
              Icons.delete,
              color: Colors.black,
            ),
            onPressed: () async {
              await ApiHelper.apiHelperObj
                  .myDeleteApi(get_students, widget.singleStudent);
            },
          ),
        )
      ],
    );
  }
}
