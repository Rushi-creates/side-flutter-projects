import 'package:flutter/material.dart';
import 'package:hostel_management_system/global.dart';
import 'package:hostel_management_system/models/Student.dart';
import 'package:hostel_management_system/reusable_widgets/textFields_&_tableRow.dart';
import 'package:hostel_management_system/screens/Students_details.dart';
import 'package:hostel_management_system/services/api.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

//to change class name = right click on className> Rename symbol
class UpdateStudetDetails extends StatefulWidget {
  StudentModel? singleStudent;
  UpdateStudetDetails({this.singleStudent});

  UpdateStudetDetails.passSinglestudent({this.singleStudent});

  @override
  _UpdateStudetDetailsState createState() => _UpdateStudetDetailsState();
}

class _UpdateStudetDetailsState extends State<UpdateStudetDetails> {
  bool isFeesPaid = false;

  final _createFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController room_No_Controller = TextEditingController();
  TextEditingController hostel_fees_Controller = TextEditingController();
  TextEditingController mess_fees_Controller = TextEditingController();
  TextEditingController attendance_Controller = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.singleStudent != null) {
  //     nameController = widget.singleStudent!.name as TextEditingController;
  //   }
  // }

  //  void myPostApi() {
  //   client.post(Uri.parse(get_students),body: passJsonData);
  // }

  Client client = http.Client();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              updateStudentForm(),
            ],
          ),
        ));
  }

  updateStudentForm() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _createFormKey,
            child: Column(
              children: [
                buildTextField(nameController, "Name"),
                buildTextField(emailController, "Email"),
                buildTextField(addressController, "Address"),
                buildTextField(phoneController, "Phone"),
                buildTextField(room_No_Controller, "Room number"),
                buildTextField(hostel_fees_Controller, "Hostel fees"),
                buildTextField(mess_fees_Controller, "Mess fess"),
                // Row(
                //   children: [
                //     Text("Hostel fees payment"),
                //     Checkbox(value: isFeesPaid, onChanged: onCheckBoxChanged()),
                //   ],
                // ),

                //********form button here ******
                TextButton(
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                  onPressed: () async {
                    //
                    if (_createFormKey.currentState!.validate()) {
                      //call functioinality here , when button is pressed
                      StudentModel sModelObj = StudentModel(
                        // id: widget.singleStudent!.id,
                        id: widget.singleStudent!.id
                            .toString(), //Todo : ask varad to change overall id to string , or else it wont accept here
                        name: nameController.text,
                        email: emailController.text,
                        address: addressController.text,
                        phone: phoneController.text,
                        room_number: room_No_Controller.text,
                        hostel_fees: hostel_fees_Controller.text,
                        mess_fees: mess_fees_Controller.text,
                      );

                      // widget.singleStudent == null
                      //     ? client.post(Uri.parse(get_students),
                      //         body: sModelObj.toMap())
                      //     : null;

                      //! Add user commented for testing purpose
                      // await widget.singleStudent == null
                      //     ? await ApiHelper.apiHelperObj
                      //         .myPostApi(get_students, sModelObj)
                      //     :
                      await ApiHelper.apiHelperObj.myUpdateApi(
                          update_students, sModelObj, sModelObj.id);
                      //Navigation functionality if needed,
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // onCheckBoxChanged() {
  //   setState(() {
  //     isFeesPaid = true;
  //   });
  // }

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
        "Update student", //give here appBar title
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
