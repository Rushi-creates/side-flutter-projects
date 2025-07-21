import 'package:flutter/material.dart';
import 'package:hostel_management_system/global.dart';
import 'package:hostel_management_system/new%20api%20trial/employee_model.dart';
import 'package:hostel_management_system/new%20api%20trial/newApiHelper.dart';
import 'package:hostel_management_system/new%20api%20trial/newGLobal.dart';
import 'package:hostel_management_system/reusable_widgets/textFields_&_tableRow.dart';
import 'package:hostel_management_system/services/api.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

//to change class name = right click on className> Rename symbol
class createOrUpdateEmployee extends StatefulWidget {
  const createOrUpdateEmployee({Key? key}) : super(key: key);

  @override
  _createOrUpdateEmployeeState createState() => _createOrUpdateEmployeeState();
}

class _createOrUpdateEmployeeState extends State<createOrUpdateEmployee> {
  bool isFeesPaid = false;

  Client client = http.Client();

  final _createFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController room_No_Controller = TextEditingController();
  TextEditingController hostel_fees_Controller = TextEditingController();
  TextEditingController mess_fees_Controller = TextEditingController();
  TextEditingController attendance_Controller = TextEditingController();
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

  // void myDeleteApi() {
  //   client.delete(url);
  //   myFetchApi();
  // }

  Future<void> myPostApi(url, passJsonData) async {
    await client.post(Uri.parse(url), body: passJsonData);
  }

  // void myUpdateApi() {
  //   client.put(url, passJsonData);
  // }

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
                // buildTextField(addressController, "Address"),
                // buildTextField(phoneController, "Phone"),
                // buildTextField(room_No_Controller, "Room number"),
                // buildTextField(hostel_fees_Controller, "Hostel fees"),
                // buildTextField(mess_fees_Controller, "Mess fess"),
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
                    if (_createFormKey.currentState!.validate()) {
                      //call functioinality here , when button is pressed
                      // NewStudent nsModelObj = NewStudent(
                      //   id: 78,
                      //   name: nameController.text,
                      //   email: emailController.text,
                      //   address: addressController.text,
                      //   phone: phoneController.text,
                      //   room_number: room_No_Controller.text,
                      //   hostel_fees: hostel_fees_Controller.text,
                      //   mess_fees: mess_fees_Controller.text,
                      // );

                      Note noteObj = Note(
                          id: 4,
                          body: emailController.text,
                          title: nameController.text,
                          userId: 4);

                      // await ApiHelper.apiHelperObj
                      //     .myPostApi(get_students, nsModelObj);

                      // await myPostApi(get_students, nsModelObj.toMap());

                      await EmployeeAPi.apiHelperObj.myUpdateApi(
                        getPosts,
                        noteObj,
                      );
                      // await  EmployeeAPi.apiHelperObj.addEmployee(getPosts, noteObj);
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

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      //leading: IconButton(
      //  icon: Icon(
      //   Icons.arrow_back,
      //   color: Colors.black,
      //   ),
      //   onPressed: null,
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "create or update employee", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      //actions: [

      //  Padding(
      //    padding: const EdgeInsets.all(8.0),
      //   child: IconButton(
      //       onPressed: null,
      //       icon: Icon(
      //         Icons.search,
      //         color: Colors.black,
      //       )), )
      // \\ ],
    );
  }
}
