// import 'package:flutter/foundation.dart';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart' as path;

// class HardwareBackend extends ChangeNotifier {
//   var currentUser = FirebaseAuth.instance.currentUser!;
//   UploadTask? task;
//   var urlDownload;
//   File? selectedFileOrImg;
//   bool isFileSelectedYet = false;
//   bool isFileNotImg = false;
//   bool isTaskCompleted = false;

//   List multiFileOrImgList = [];

//   // new declaration

//   File? storePickedImage;
//   bool isImagePickBool = false;
//   /* -------------------------------------------------------------------------- */
// /*               //! pick image from gallery/camera ( single  )               */
// /* -------------------------------------------------------------------------- */

//   Future pickImageTemp(ImageSource sourceArg) async {
//     try {
//       //make sure to download the image_picker dependency
//       final image = await ImagePicker().pickImage(source: sourceArg);
//       if (image == null) return;

//       final imgTemporary = File(image.path);
//       print(imgTemporary.toString());
//       notifyListeners();
//       return imgTemporary;
//       // setState(() {
//       // this.selectedFileOrImg = imgTemporary;
//       // });

//     } on PlatformException catch (e) {
//       print("Failed to pick image $e");
//       notifyListeners();
//       return null;
//     }
//   }
// /* -------------------------------------------------------------------------- */
// /*             //! pick image from gallery/camera ( multiple )                */
// /* -------------------------------------------------------------------------- */

// //   Future pickMultiImage() async {
// //     if (multiFileOrImgList.isNotEmpty) {
// //       multiFileOrImgList.clear();
// //     }
// //     try {
// //       //make sure to download the image_picker dependency
// //       final List<XFile>? imgList = await ImagePicker().pickMultiImage();
// //       if (imgList!.isNotEmpty) {
// //         // setState(() {
// //         multiFileOrImgList = imgList;
// //         // });
// //         print("============>${multiFileOrImgList.length}");
// //       } else {
// //         setState(() {});

// //         return;
// //       }
// //     } on PlatformException catch (e) {
// //       print("Something went wrong : $e");
// //     }
// //     setState(() {});
// //   }

// // /* -------------------------------------------------------------------------- */
// // /*               //! pick any file from phone ( single )                      */
// // /* -------------------------------------------------------------------------- */

// //   Future selectFile() async {
// //     final result = await FilePicker.platform.pickFiles(allowMultiple: false);
// //     if (result == null) return;
// //     final path = result.files.single.path!;
// //     setState(() {
// //       selectedFileOrImg = File(path);
// //     });
// //   }

// // /* -------------------------------------------------------------------------- */
// // /*              //! pick any file from phone  ( multiple )                    */
// // /* -------------------------------------------------------------------------- */

// //   Future selectMultiFiles() async {
// //     FilePickerResult? result =
// //         await FilePicker.platform.pickFiles(allowMultiple: true);

// //     if (result != null) {
// //       List<File> files = result.paths.map((path) => File(path!)).toList();
// //       setState(() {
// //         multiFileOrImgList = files;
// //       });
// //     } else {
// //       return;
// //       // User canceled the picker
// //     }
// //   }
// /* -------------------------------------------------------------------------- */
// /*                         //! Upload to firebase                             */
// /* -------------------------------------------------------------------------- */

// //   Future uploadFile(pathArg, fileArg) async {
// //     if (fileArg == null) return;

// //     try {
// //       //adding file selected by user, into above mentioned path of firebase
// //       task = pathArg.putFile(fileArg!);
// //     } on FirebaseException catch (e) {
// //       return print("Couldn't upload the selected file $e");
// //     }

// //     setState(() {});

// //     //? this below code is for getting the DOWNLOAD LINK, of uploaded image
// //     if (task == null) return;
// //     final snapshot = await task!.whenComplete(() {
// //       setState(() {
// //         isTaskCompleted = true;
// //       });
// //     });

// //     //this urlDownload var , will store the download link , use whereever we want in UI
// //     urlDownload = await snapshot.ref.getDownloadURL();
// //     print('Download-Link: $urlDownload ');
// //   }

// // /* -------------------------------------------------------------------------- */
// // /*                       //! show upload percentage                           */
// // /* -------------------------------------------------------------------------- */
// //   Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
// //         stream: task.snapshotEvents,
// //         builder: (context, snapshot) {
// //           if (snapshot.hasData) {
// //             // notifyListeners();

// //             final snap = snapshot.data!;

// //             final progress = snap.bytesTransferred / snap.totalBytes;
// //             final percentage = (progress * 100).toStringAsFixed(2);
// //             // print(progress);

// //             return Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 Text(
// //                   isTaskCompleted
// //                       ? "Upload completed"
// //                       : "Upload progress : $percentage %",
// //                   textAlign: TextAlign.center,
// //                 ),
// //               ],
// //             );
// //           } else {
// //             return Container();
// //           }
// //         },
// //       );

//   myPickImageButton(sourceArg) {
//     return Column(
//       children: [
//         TextButton(
//           child: Text(
//             "Pick Image",
//             style: TextStyle(color: Colors.white),
//           ),
//           style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
//           onPressed: () async {
//             isImagePickBool = true;

//             storePickedImage = await pickImageTemp(ImageSource.sourceArg);
//             notifyListeners();
//           },
//         ),
//         isImagePickBool
//             ? Text(
//                 path.basename(storePickedImage == null
//                     ? "Not Selected yet"
//                     : storePickedImage!.path),
//                 // maxLines: 2,
//                 // overflow: TextOverflow.ellipsis,
//                 // textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black,
//                   // decoration: TextDecoration.none,
//                   // fontStyle: FontStyle.italic,
//                   // fontFamily: "FontNameHere" ,
//                   // fontWeight: FontWeight.bold,
//                   // fontWeight: FontWeight.w300,
//                   // fontSize: 20.0,
//                 ),
//               )
//             : Text(''),
//       ],
//     );
//   }
// }
