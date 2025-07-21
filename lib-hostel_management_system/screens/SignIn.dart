import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/authUserModel.dart';
import '../provider/auth_provider.dart';
import '../services/firestoreDB.dart';

//to change class name = right click on className> Rename symbol
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: signInHeader(),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            signInButton(),
          ],
        ),
      ),
    );
  }

  AppBar signInHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      automaticallyImplyLeading: true, //removes default back arrow on appbar

      title: Text(
        "Sign in screen", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }

  TextButton signInButton() {
    return TextButton(
      child: Text(
        "Sign in button",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
      onPressed: () {
        final provider =
            Provider.of<GoogleSignProvider>(context, listen: false);
        provider.googleLogin().then((value) {
          // provider.isAlreadyUser = true;
          var path = FirebaseFirestore.instance
              .collection('Users')
              .doc(value.user.uid);

          AuthUserModel authUserObj = AuthUserModel(
              //this is some of data we get from user's gmail. that we store in DB
              email: value.user.email,
              email_uid: value.user.uid,
              email_displayName: value.user.displayName,
              email_ImageUrl: value.user.photoURL,
              email_phoneNo: value.user.phoneNumber);

          DBHelper.dbHelperObj.set(path, authUserObj);
        });
      },
    );
  }
}
