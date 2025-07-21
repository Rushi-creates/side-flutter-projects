import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../global.dart';
import '../models/profileModel.dart';
import '../screens/SettingsPage.dart';

//to change class name = right click on className> Rename symbol
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  //! build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: screenHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              fetchUserProfileDoc(),
              Divider(),
            ],
          ),
        ));
  }

  //! displaying the auto-collected email data
  Column displayEmailProfile() {
    return Column(
      children: [
        ListTile(
          title: Text(currentUser.displayName!),
          subtitle: Text(currentUser.email!),
          onTap: () {
            return null;
          },
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(currentUser.photoURL!),
          ),
        ),
      ],
    );
  }

  //! fetchUserPfp doc

  fetchUserPfp_doc() {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        //Todo: pass here the 'whole' fetching path of 'document' from firebase
        future: FirebaseFirestore.instance
            .collection('Profile image')
            .doc(currentUser.uid)
            .get(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            Center(child: Text("Something went wrong: ${snapshot.error}"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data!.data() == null) {
            return CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.no_accounts,
                color: Colors.white,
              ),
            );
          }

          var fetchedDoc = snapshot.data!.data();

          //Todo: change UI here , and display data as req
          return CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(fetchedDoc!['imgURL']),
          );
        });
  }

  //! display app userName of user , collected from edit profile page profile-form
  fetchUserProfileDoc() {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        //Todo: pass here the 'whole' fetching path of 'document' from firebase
        future: FirebaseFirestore.instance
            .collection('ProfileData')
            .doc(currentUser.uid)
            .get(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            Center(child: Text("Something went wrong: ${snapshot.error}"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data!.data() == null) {
            return Column(
              children: [
                displayEmailProfile(),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "No profile created,\nProceed to settings to set up your profile",
                    // maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      // decoration: TextDecoration.none,
                      // fontStyle: FontStyle.italic,
                      // fontFamily: "FontNameHere" ,
                      fontWeight: FontWeight.bold,
                      // fontWeight: FontWeight.w300,
                      // fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            );
          }
          var fetchedDoc = snapshot.data!.data();
          ProfileModel profileModelObj = ProfileModel.fromMap(fetchedDoc!);

          //Todo: change UI here , and display data as req
          return ListTile(
              title: Text(profileModelObj.userName!),
              subtitle: Text(profileModelObj.bio!),
              onTap: () {
                return null;
              },
              leading: SizedBox(
                width: 50,
                child: fetchUserPfp_doc(),
              ));
        });
  }

  //! appbar
  AppBar screenHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      leading: currentUser.email.toString() == adminEmail ||
              currentUser.email.toString() == wardenEmail
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : null,

      title: Text(
        "Profile", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),

      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 10, 14.0, 10),
          child: IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return SettingsPage();
              }));

              if (result == true || result != null) {
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}
