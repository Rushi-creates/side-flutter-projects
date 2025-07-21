import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../global.dart';
import '../models/profileModel.dart';
import '../provider/auth_provider.dart';
import '../services/firestoreDB.dart';

//to change class name = right click on className> Rename symbol
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _createFormKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  var currentUser = FirebaseAuth.instance.currentUser!;

  UploadTask? task;
  var urlDownload;
  File? selectedFileOrImg;
  bool isFileSelectedYet = false;
  bool isTaskCompleted = false;

  //!  Init state
  @override
  void initState() {
    super.initState();
    fetchDoc();
  }

  fetchDoc() async {
    DocumentSnapshot pathData = await FirebaseFirestore.instance
        .collection('ProfileData')
        .doc(currentUser.uid)
        .get();

    if (pathData.exists) {
      Map<String, dynamic>? fetchDoc = pathData.data() as Map<String, dynamic>?;
      ProfileModel pmObj = ProfileModel.fromMap(fetchDoc!);

      userNameController.text = pmObj.userName!;
      bioController.text = pmObj.bio!;
      setState(() {});
    }
  }

  //! Build method
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      // resizeToAvoidBottomInset: false,
      appBar: screenHeader(),
      body: screenBody(),
    );
  }

  //! appbar
  AppBar screenHeader() {
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
          Navigator.pop(context, true);
        },
      ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "Settings", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }

//! body
  SingleChildScrollView screenBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            chooseProficPic(),
            profileForm(),
            Divider(thickness: 2),
            cautionZone(),
          ],
        ),
      ),
    );
  }

  Padding profileForm() {
    var dimVar =
        MediaQuery.of(context).size; //declare only this line in build()

    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _createFormKey,
            child: Column(
              children: [
                Text(
                  "Edit Profile",
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: dimVar.height * 0.03,
                ),
                // Text(modelObj.userName!),
                //******First text Field from here *****
                TextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field required'; //if empty give error msg here
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter new app userName", //hint text here
                  ),
                ),
                SizedBox(
                  height: dimVar.height * 0.04,
                ),
                //****** text Field from here *****
                TextFormField(
                  // initialValue: modelObj.bio,
                  controller:
                      bioController, //declare a controller and then pass here
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field required'; //if empty give error msg here
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter your new bio", //hint text here
                  ),
                ),
                SizedBox(
                  height: dimVar.height * 0.04,
                ),

                TextButton(
                  child: Text(
                    "Change profile details",
                    style: TextStyle(color: Colors.white),
                  ),
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.pink[600]),
                  onPressed: () {
                    if (_createFormKey.currentState!.validate()) {
                      //call functioinality here , when button is pressed

                      var path = FirebaseFirestore.instance
                          .collection('ProfileData')
                          .doc(currentUser.uid);

                      var mapData = ProfileModel(
                          userName: userNameController.text,
                          bio: bioController.text);

                      //!changed here
                      setState(() {
                        DBHelper.dbHelperObj.set(path, mapData);
                        userNameController.clear();
                        bioController.clear();
                      });
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

  cautionZone() {
    var dimVar =
        MediaQuery.of(context).size; //declare only this line in build()

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: dimVar.width * 0.9,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CAUTION ZONE !",
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    // decoration: TextDecoration.none,
                    // fontStyle: FontStyle.italic,
                    // fontFamily: "FontNameHere" ,
                    fontWeight: FontWeight.bold,
                    // fontWeight: FontWeight.w300,
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  height: dimVar.height * 0.02,
                ),
                TextButton(
                  child: Text(
                    "Sign Out of app",
                    style: TextStyle(color: Colors.white),
                  ),
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.pink[600]),
                  onPressed: () {
                    Navigator.pop(context);
                    if (currentUser.email.toString() == adminEmail ||
                        currentUser.email.toString() == wardenEmail) {
                      Navigator.pop(context);
                    }
                    final provider =
                        Provider.of<GoogleSignProvider>(context, listen: false);
                    provider.logout();
                  },
                ),
                SizedBox(
                  height: dimVar.height * 0.01,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    color: Colors.red[900],
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
                      child: TextButton(
                        child: Text(
                          "Delete your account !!",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.pink[600]),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.all(14.0),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Warning!",
                                          // maxLines: 2,
                                          // overflow: TextOverflow.ellipsis,
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            // decoration: TextDecoration.none,
                                            // fontStyle: FontStyle.italic,
                                            // fontFamily: "FontNameHere" ,
                                            fontWeight: FontWeight.bold,
                                            // fontWeight: FontWeight.w300,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                      Text(
                                          "Are you sure you want to delete your account? This can't be undone, once deleted."),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text("Delete permanently"),
                                      onPressed: () {
                                        //!code to delete user acc
                                        //example of deleting one collection
                                        var path2 = FirebaseFirestore.instance
                                            .collection('ProfileData')
                                            .doc(currentUser.uid);
                                        DBHelper.dbHelperObj.delete(path2);

                                        var path3 = FirebaseFirestore.instance
                                            .collection('Profile image')
                                            .doc(currentUser.uid);
                                        DBHelper.dbHelperObj.delete(path3);

                                        //before this below steps , delete all other collections , like its done just above this
                                        //then only delete the 'users' collection, ( that is below step)
                                        var path1 = FirebaseFirestore.instance
                                            .collection('Users')
                                            .doc(currentUser.uid);
                                        DBHelper.dbHelperObj
                                            .delete(path1)
                                            .then((value) {
                                          currentUser
                                              .delete(); //! to delete user-auth acc(imp)

                                          final provider =
                                              Provider.of<GoogleSignProvider>(
                                                  context,
                                                  listen: false);
                                          provider.logout().then((value) {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                            if (currentUser.email.toString() ==
                                                    adminEmail ||
                                                currentUser.email.toString() ==
                                                    wardenEmail) {
                                              Navigator.pop(context);
                                            }
                                          });
                                        });
                                      },
                                    )
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//! Choose profile image , card
  chooseProficPic({
    fireS_coll_pathArg,
    bool showGalleryButton = true,
    bool showCameraButton = true,
  }) {
    // //! checking if Firebase-storage path is provided in arg or not
    var fb_Storage_pathArg = FirebaseStorage.instance
        .ref()
        .child('Store user Profile images')
        .child(currentUser.uid)
        .child(selectedFileOrImg == null
            ? currentUser.uid
            : path.basename(selectedFileOrImg!.path));
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                GestureDetector(
                    child: selectedFileOrImg == null
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 50,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ClipOval(
                              child: Image.file(
                                selectedFileOrImg!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: Text('Select an option'),
                              children: [
                                showGalleryButton
                                    ? SimpleDialogOption(
                                        child: Text('Select from gallery'),
                                        onPressed: () {
                                          pickImageTemp(ImageSource.gallery);

                                          isFileSelectedYet = true;
                                          Navigator.pop(context);
                                        },
                                      )
                                    : Container(),
                                showCameraButton
                                    ? SimpleDialogOption(
                                        child: Text('Capture from camera'),
                                        onPressed: () {
                                          pickImageTemp(ImageSource.camera);
                                          isFileSelectedYet = true;
                                          Navigator.pop(context);
                                        },
                                      )
                                    : Container(),
                                SimpleDialogOption(
                                  child: Text(
                                    'Go back',
                                    style: TextStyle(color: Colors.grey[500]),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    }),
                Positioned(
                  bottom: 15,
                  right: 20,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.create,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                      SizedBox(width: 7),
                      Text(
                        " Confirm Image ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: isFileSelectedYet
                          // || isTaskCompleted
                          ? Colors.red[600]
                          : Colors.grey),
                  onPressed: () {
                    if (isTaskCompleted) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Image already uploaded. \nClick on image to upload a new image."),
                      ));
                      return; //exit the onPressed func , if task is already completed
                    }
                    if (isFileSelectedYet) {
                      uploadFile(fb_Storage_pathArg, selectedFileOrImg).then(
                        (value) {
                          if (fireS_coll_pathArg == null) {
                            FirebaseFirestore.instance
                                .collection('Profile image')
                                .doc(currentUser.uid)
                                .set({
                              "imgURL": urlDownload,
                              "ownerId": currentUser.uid
                            });
                            // we can give any other hardcoded folderName
                            //we give same name to fileName from phone , to the store in firestoreDB
                          } else {
                            //! checking if user has provided Firestore path , and modelObj to add to firestore
                            fireS_coll_pathArg.set({
                              "pfpImgUrl": urlDownload,
                              "ownerId": currentUser.uid
                            });
                          }
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Select an image first, by clicking on circle"),
                      ));
                      return null;
                    }
                  },
                ),
                task != null
                    ? buildUploadStatus(task!)
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Upload progress : 00.00%",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*               //! pick image from gallery/camera ( single  )               */
/* -------------------------------------------------------------------------- */

  Future pickImageTemp(ImageSource sourceArg) async {
    try {
      //make sure to download the image_picker dependency
      final image = await ImagePicker().pickImage(source: sourceArg);
      if (image == null) return;

      final imgTemporary = File(image.path);
      setState(() {
        this.selectedFileOrImg = imgTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image $e");
    }
  }

/* -------------------------------------------------------------------------- */
/*                         //! Upload to firebase                             */
/* -------------------------------------------------------------------------- */

  Future uploadFile(pathArg, fileArg) async {
    if (fileArg == null) return;

    try {
      //adding file selected by user, into above mentioned path of firebase
      task = pathArg.putFile(fileArg!);
    } on FirebaseException catch (e) {
      return print("Couldn't upload the selected file $e");
    }

    setState(() {});

    //? this below code is for getting the DOWNLOAD LINK, of uploaded image
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {
      setState(() {
        isTaskCompleted = true;
      });
    });

    //this urlDownload var , will store the download link , use whereever we want in UI
    urlDownload = await snapshot.ref.getDownloadURL();
    print('Download-Link: $urlDownload ');
  }

/* -------------------------------------------------------------------------- */
/*                       //! show upload percentage                           */
/* -------------------------------------------------------------------------- */
  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // notifyListeners();

            final snap = snapshot.data!;

            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);
            // print(progress);

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isTaskCompleted
                      ? "Upload completed"
                      : "Upload progress : $percentage %",
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      );
}
