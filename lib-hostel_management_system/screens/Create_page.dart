import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../models/userPosts.dart';
import '../services/firestoreDB.dart';
import 'package:uuid/uuid.dart';

//to change class name = right click on className> Rename symbol
class CreatePosts extends StatefulWidget {
  const CreatePosts({Key? key}) : super(key: key);

  @override
  _CreatePostsState createState() => _CreatePostsState();
}

class _CreatePostsState extends State<CreatePosts> {
//Todo: make sure to import and use the Uuid, package , if we create userPost form here
  var currentUser = FirebaseAuth.instance.currentUser!;
  String postIdVar = Uuid().v4();

  //make sure you move this up & declare this in stateClass ( not in build()) ,then comment this line
  final _createFormKey = GlobalKey<FormState>();
  TextEditingController captionController =
      TextEditingController(); //create more controller here, if needed

//! Pick file vars
  UploadTask? task;
  var urlDownload;
  File? selectedFileOrImg;
  bool isFileSelectedYet = false;
  bool isFileNotImg = false;
  bool isTaskCompleted = false;
  List multiFileOrImgList = [];

//! Build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: screenHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              postsForm(),
            ],
          ),
        ));
  }

//! accept data
  postsForm() {
    var dimVar =
        MediaQuery.of(context).size; //declare only this line in build()

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
                //! pick image
                chooseSingleFileOrImg(),

                //******First text Field from here *****
                TextFormField(
                  controller: captionController,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field required'; //if empty give error msg here
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Enter your caption", //hint text here
                  ),
                ),
                SizedBox(
                  height: dimVar.height * 0.04,
                ),

                //********form button here ******
                TextButton(
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor:
                          isFileSelectedYet ? Colors.deepPurple : Colors.grey),
                  onPressed: () {
                    if (_createFormKey.currentState!.validate()) {
                      //call functioinality here , when button is pressed
                      if (isTaskCompleted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "File already uploaded. \nClick 'Selct file' to upload another file."),
                        ));
                        return; //exit the onPressed func , if task is already completed
                      }
                      if (isFileSelectedYet) {
                        var fb_Storage_path = FirebaseStorage.instance
                            .ref()
                            .child('Single picked image or file')
                            .child(currentUser.uid)
                            .child(selectedFileOrImg == null
                                ? DateTime.now().toString()
                                : path.basename(selectedFileOrImg!.path));
                        uploadFile(fb_Storage_path, selectedFileOrImg).then(
                          (value) {
                            // if (fireS_coll_pathArg == null) {
                            //   FirebaseFirestore.instance
                            //       .collection('Single picked image or file')
                            //       .add({
                            //     "imgURL": urlDownload,
                            //     "email_uid": currentUser.uid
                            //   });
                            //   // we can give any other hardcoded folderName
                            //   //we give same name to fileName from phone , to the store in firestoreDB

                            // } else {
                            //   //! checking if user has provided Firestore path , and modelObj to add to firestore
                            //   fireS_coll_pathArg.add({
                            //     "imgURL": urlDownload,
                            //     "email_uid": currentUser.uid
                            //   });
                            // }
                            // uploadFile(pathRef, selectedFile).  then((value) {
                            var pathArg = FirebaseFirestore.instance
                                    .collection('User Posts')
                                // .doc(currentUser.uid)
                                ;

                            //! posts model obj
                            ImgPostModel postModelObj = ImgPostModel(
                                postId: Uuid().v4(),
                                imgUrl: urlDownload,
                                ownerId: currentUser.uid,
                                captionController: captionController.text,
                                timeStamp: DateTime.now());

                            //! firestore set crud
                            DBHelper.dbHelperObj
                                .add(pathArg, postModelObj)
                                .then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Post created"),
                              ));
                              setState(() {
                                captionController.clear();
                                selectedFileOrImg = null;
                                isFileNotImg = false;
                                isFileSelectedYet = false;
                                postIdVar = Uuid().v4();
                              });
                            });
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Select a file first"),
                        ));
                        return null;
                      }
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

  //! appBar
  AppBar screenHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,

      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "Create", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                     //! Pick image or file HELPER FUNCS                    */
/* -------------------------------------------------------------------------- */

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
/*             //! pick image from gallery/camera ( multiple )                */
/* -------------------------------------------------------------------------- */

  Future pickMultiImage() async {
    if (multiFileOrImgList.isNotEmpty) {
      multiFileOrImgList.clear();
    }
    try {
      //make sure to download the image_picker dependency
      final List<XFile>? imgList = await ImagePicker().pickMultiImage();
      if (imgList!.isNotEmpty) {
        // setState(() {
        multiFileOrImgList = imgList;
        // });
        print("============>${multiFileOrImgList.length}");
      } else {
        setState(() {});

        return;
      }
    } on PlatformException catch (e) {
      print("Something went wrong : $e");
    }
    setState(() {});
  }

/* -------------------------------------------------------------------------- */
/*               //! pick any file from phone ( single )                      */
/* -------------------------------------------------------------------------- */

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      selectedFileOrImg = File(path);
    });
  }

/* -------------------------------------------------------------------------- */
/*              //! pick any file from phone  ( multiple )                    */
/* -------------------------------------------------------------------------- */

  Future selectMultiFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      setState(() {
        multiFileOrImgList = files;
      });
    } else {
      return;
      // User canceled the picker
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
                      ? "Upload completed, \nSelect new file"
                      : "Upload progress : \n$percentage %",
                  textAlign: TextAlign.center,
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      );

/* -------------------------------------------------------------------------- */
/*                       //! Pick multiple images/files                       */
/* -------------------------------------------------------------------------- */
  chooseMultiFileOrImg({
    fireS_coll_pathArg, //dont include doc () in path while calling, since add crud is included in this func
    bool showGalleryButton = true,
    bool showFileButton = true,
  }) {
    var fb_Storage_path = FirebaseStorage.instance
        .ref()
        .child('MultiPicked Images or Files')
        .child(currentUser.uid)
        .child(DateTime.now().toString());
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        child: Row(
                          children: [
                            Icon(
                              Icons.create_new_folder,
                              color: Colors.white,
                            ),
                            SizedBox(width: 7),
                            Text(
                              "Select files",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue[600]),
                        onPressed: () {
                          isTaskCompleted = false;
                          // isFileNotImg = false;
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  title: Text('Select '),
                                  children: [
                                    showGalleryButton
                                        ? SimpleDialogOption(
                                            child: Text('Select from gallery'),
                                            onPressed: () {
                                              isFileSelectedYet = true;
                                              isFileNotImg = false;
                                              pickMultiImage();
                                              Navigator.pop(context);
                                            },
                                          )
                                        : Container(),
                                    // showCameraButton
                                    //     ? SimpleDialogOption(
                                    //         child: Text('Capture from camera'),
                                    //         onPressed: () {
                                    //           pickImageTemp(ImageSource.camera);
                                    //           isFileSelectedYet = true;
                                    //           Navigator.pop(context);
                                    //         },
                                    //       )
                                    //     : Container(),
                                    showFileButton
                                        ? SimpleDialogOption(
                                            child: Text(
                                                'Select any file from phone'),
                                            onPressed: () {
                                              isFileSelectedYet = true;
                                              isFileNotImg = true;
                                              selectMultiFiles();
                                              Navigator.pop(context);
                                            },
                                          )
                                        : Container(),
                                    SimpleDialogOption(
                                      child: Text(
                                        'Go back',
                                        style:
                                            TextStyle(color: Colors.grey[500]),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                                // });
                              });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        child: Row(
                          children: [
                            Icon(
                              Icons.save,
                              color: Colors.white,
                            ),
                            SizedBox(width: 7),
                            Text(
                              "Save File  ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: isFileSelectedYet
                                // isTaskCompleted == false
                                ? Colors.pink[600]
                                : Colors.grey),
                        onPressed: () {
                          if (isTaskCompleted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "File already uploaded. \nClick 'Selct files' to upload another file."),
                            ));
                            return; //exit the onPressed func , if task is already completed
                          }
                          if (isFileSelectedYet) {
                            for (int i = 0;
                                i < multiFileOrImgList.length;
                                i++) {
                              uploadFile(fb_Storage_path,
                                      File(multiFileOrImgList[i].path))
                                  .then(
                                (value) {
                                  if (fireS_coll_pathArg == null) {
                                    FirebaseFirestore.instance
                                        .collection(
                                            'Multi picked images or files')
                                        // .doc(currentUser.uid)
                                        .add({
                                      "imgURL": urlDownload,
                                      "email_uid": currentUser.uid
                                    });
                                    // we can give any other hardcoded folderName
                                    //we give same name to fileName from phone , to the store in firestoreDB

                                  } else {
                                    //! checking if user has provided Firestore path , and modelObj to add to firestore
                                    fireS_coll_pathArg.add({
                                      "imgURL": urlDownload,
                                      "email_uid": currentUser.uid
                                    });
                                  }
                                },
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Select a file first"),
                            ));
                            return null;
                          }
                        },
                      ),
                    )
                  ],
                ),
                task == null
                    ? Text(
                        "Upload progress : 00.00%",
                        style: TextStyle(color: Colors.grey),
                      )
                    : buildUploadStatus(task!)
              ],
            ),

            //!display from here
            SizedBox(
              height: 15,
            ),
            isFileSelectedYet
                ? GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isFileNotImg ? 2 : 3),
                    itemCount: multiFileOrImgList.length,
                    itemBuilder: (context, i) {
                      return isFileNotImg
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                // width: 130,
                                child: Card(
                                  // width: 180,
                                  color: Colors.grey[300],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.file_copy,
                                          size: 60,
                                        ),
                                        Text("Selected File :"),
                                        Text(
                                          // "here list of names of all files selected",
                                          path.basename(
                                              multiFileOrImgList[i].path),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.file(
                                (File(
                                  multiFileOrImgList[i]!.path,
                                )),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            );
                    })
                : Container(),
          ],
        ),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/* //! choose Single FILE OR Image(camera/gallery)doesnt replace,keeps adding */
/* -------------------------------------------------------------------------- */
  chooseSingleFileOrImg({
    fireS_coll_pathArg, // if this is passed while calling , then in path dont include .doc(), as we have used .add ccrud
    bool showGalleryButton = true,
    bool showCameraButton = true,
    bool showFileButton = true,
  }) {
    //! checking if Firebase-storage path is provided in arg or not

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isFileNotImg == true
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 130,
                  child: Card(
                    // width: 180,
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.file_copy,
                            size: 60,
                          ),
                          Text("Selected File :"),
                          Text(
                            path.basename(selectedFileOrImg!.path),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              // decoration: TextDecoration.none,
                              // fontStyle: FontStyle.italic,
                              // fontFamily: "FontNameHere" ,
                              fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.w300,
                              // fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipOval(
                  child: selectedFileOrImg != null
                      ? Image.file(
                          selectedFileOrImg!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 50,
                        ),
                ),
              ),
        SizedBox(
          width: 15,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // pickSingleNotMultiImg
            //     ?
            TextButton(
              child: Row(
                children: [
                  Icon(
                    Icons.create_new_folder,
                    color: Colors.white,
                  ),
                  SizedBox(width: 7),
                  Text(
                    "Select file",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
              onPressed: () {
                isTaskCompleted = false;
                isFileNotImg = false;
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text('Select '),
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
                          showFileButton
                              ? SimpleDialogOption(
                                  child: Text('Select any file from phone'),
                                  onPressed: () {
                                    isFileNotImg = true;
                                    selectFile();
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
                      // });
                    });
              },
            ),

            // TextButton(
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.save,
            //         color: Colors.white,
            //       ),
            //       SizedBox(width: 7),
            //       Text(
            //         "Save File  ",
            //         style: TextStyle(color: Colors.white),
            //       ),
            //     ],
            //   ),
            //   style: TextButton.styleFrom(
            //       backgroundColor: isFileSelectedYet
            //           // isTaskCompleted == false
            //           ? Colors.pink[600]
            //           : Colors.grey),
            //   onPressed: () {},
            // ),
            task != null
                ? buildUploadStatus(task!)
                : Text(
                    "Upload progress : \n00.00%",
                    style: TextStyle(color: Colors.grey),
                  ),
          ],
        ),
      ],
    );
  }

//! Choose single image, but keep replaceing , itself
  chooseProficPic(
    fireS_coll_pathArg, {
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
                          fireS_coll_pathArg.set({"pfpImgUrl": urlDownload});
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
}
