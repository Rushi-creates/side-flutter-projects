import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hostel_management_system/test_provider/old_hardware.dart';
import 'package:hostel_management_system/test_provider/new_UploadCards.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';

//to change class name = right click on className> Rename symbol
class PickImageCards extends StatefulWidget {
  const PickImageCards({Key? key}) : super(key: key);

  @override
  _PickImageCardsState createState() => _PickImageCardsState();
}

class _PickImageCardsState extends State<PickImageCards> {
  var currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: card1(),
    );
  }

  card1() {
    var trialPath1 = FirebaseFirestore.instance
        .collection('NewProfileData')
        .doc(currentUser.uid);
    return Center(
      child: Column(
        children: [
          // Provider.of<HardwareBackend>(context)
          // Consumer<HardwareBackend>(builder: (context, dataArg, child) {
          //   // just mention these 3 args here
          //   // functionOne holds var which shows initial value before button click , and changes its value as per backendFunction later , when button is click
          //   return dataArg.chooseProficPic(context, trialPath1);
          // }),
          // Consumer<HardwareBackend>(builder: (context, dataArg, child) {
          //   // just mention these 3 args here
          //   // functionOne holds var which shows initial value before button click , and changes its value as per backendFunction later , when button is click
          //   return dataArg.chooseSingleFileOrImg(context);
          // }),
          Consumer<HardwareBackend>(builder: (context, dataArg, child) {
            // just mention these 3 args here
            // functionOne holds var which shows initial value before button click , and changes its value as per backendFunction later , when button is click
            return dataArg.chooseMultiFileOrImg(context);
          }),
        ],
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
      //   onPressed: (){
      //       Navigator.pop(context);
      //   }
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "Pick images", //give here appBar title
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
      // ],
    );
  }
}
