import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/attendanceModel.dart';
import '../services/firestoreDB.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QR_attendance extends StatefulWidget {
  const QR_attendance({Key? key}) : super(key: key);

  @override
  _QR_attendanceState createState() => _QR_attendanceState();
}

class _QR_attendanceState extends State<QR_attendance> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? myController;
  Barcode? myBarcode;
  String actualQrValue = 'hms'; // add here the QR text in like "hmGym"

  bool markDone = false;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void dispose() {
    myController?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await myController!.pauseCamera();
    }
    myController!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: screenHeader(),
        body: markDone
            ? Center(
                child: Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Icon(
                            Icons.person,
                            // size: 20,
                          ),
                        ),
                        SizedBox(
                          height: 20, //(0.04/screen height)
                        ),
                        Text(
                          "Your attendance is marked",
                          // maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            // decoration: TextDecoration.none,
                            // fontStyle: FontStyle.italic,
                            // fontFamily: "FontNameHere" ,
                            fontWeight: FontWeight.bold,
                            // fontWeight: FontWeight.w300,
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          height: 10, //(0.04/screen height)
                        ),
                        Text(
                          "(You can go back safely)",
                          style: TextStyle(
                            color: Colors.white,
                            // decoration: TextDecoration.none,
                            // fontStyle: FontStyle.italic,
                            // fontFamily: "FontNameHere" ,
                            fontWeight: FontWeight.bold,
                            // fontWeight: FontWeight.w300,
                            // fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  openScanCamera(),
                  Positioned(
                    bottom: 10,
                    child: buildResult(),
                  ),
                  Positioned(
                    top: 10,
                    child: buildControlButtons(),
                  )
                ],
              )

        //   SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         ScanMyQR(),
        //         createAttendance(),
        //       ],
        //     ),
        //   ),
        );
  }

  // showAttendanceComplete() {
  //   // if (markDone) {
  //   //   return Navigator.pop(context);
  //   // } else {
  //     return markDone? Navigator.pop(context): Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         openScanCamera(),
  //         Positioned(
  //           bottom: 10,
  //           child: buildResult(),
  //         ),
  //         Positioned(
  //           top: 10,
  //           child: buildControlButtons(),
  //         )
  //       ],
  //     );
  //   // }
  // }

  AppBar screenHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          return Navigator.pop(context);
        },
      ),

      title: Text(
        "Confirmation", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }

  // Timer? timer;
  // int _start = 10;

  // void startTimer() {
  //   timer = Timer.periodic(
  //     Duration(seconds: 1),
  //     (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }

//this opens the camera for scanning
  openScanCamera() {
    return QRView(
        key: qrKey,
        overlay: QrScannerOverlayShape(
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: Colors.red,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
        onQRViewCreated: onQRViewCreated);
  }

// this is the small qr detection box
  void onQRViewCreated(QRViewController qrViewControllerArg) {
    setState(() {
      this.myController = qrViewControllerArg;
      print('=========================>onViewCreated triggerd ${myController}');
    });

    qrViewControllerArg.scannedDataStream.listen((myBarcodeValue) {
      setState(() {
        this.myBarcode = myBarcodeValue;
        print('========================================>data listened');
      });
    });
  }

  buildResult() {
    print(myBarcode != null ? "Result - ${myBarcode!.code}" : "Scan a QR code");

    // if (myBarcode?.code == actualQrValue) {
    //   createAttendance();
    // }

    if (myBarcode == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Scan QR code"),
        ),
      );
    } else if (myBarcode?.code != actualQrValue) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Wrong QR scanned"),
        ),
      );
    } else if (myBarcode?.code == actualQrValue) {
      createAttendance(); //! here we add attendance to firebase too

      // Navigator.pop(context);
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Marked present for today"),
        ),
      );
    }

//old method ,which write present for every QR in world
    // return Card(
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child:
    //     Text(
    //       myBarcode != null
    //         ? "Marked present for today"
    //         : "Scan a QR code  "),
    //   ),
    // );
  }

  createAttendance() {
//create a var , to store a path , were we want to store the passed data in firestore
    var path = FirebaseFirestore.instance
        .collection('Attendance')
        .doc("Month - ${DateTime.now().month.toString()}")
        .collection("Date - ${DateTime.now().day.toString()}")
        .doc(currentUser.email!);

//creating obj of doc's model class, to pass inside crud function
    AttendaceModel modelObj = AttendaceModel(
        userEmail: currentUser.email!,
        userName: currentUser.displayName!,
        currentTime: DateTime.now(),
        isPresent: true);

//just pass the above modelObj, toMap() NOT required,since we have written it in DBhelper class
    myBarcode != null
        ? DBHelper.dbHelperObj.set(path, modelObj).then((value) {
            // setState(() {
            markDone = true;
            // });
          })

        // .then((value) async {
        //     await myController!.pauseCamera().then((value) {
        //       setState(() {
        //         markDone = true;
        //       });
        //     });
        //     // myController!.resumeCamera();
        //   })
        : null;
  }

  Widget buildControlButtons() => Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white24,
        ), //
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: FutureBuilder<bool?>(
                future: myController?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                        snapshot.data! ? Icons.flash_on : Icons.flash_off);
                  } else {
                    return Container(
                        // child: Text("N/A"),
                        );
                  }
                },
              ), // FutureBuilder
              onPressed: () async {
                await myController?.toggleFlash();
                setState(() {});
              },
            ),

            // IconButton IconButton
            IconButton(
              icon: FutureBuilder(
                future: myController?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(Icons.switch_camera);
                  } else {
                    return Container();
                  }
                },
              ),
              onPressed: () async {
                await myController?.flipCamera();
              },
            ),
          ],
        ),
      );
}
