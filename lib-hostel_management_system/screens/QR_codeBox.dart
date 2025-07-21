import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

//to change class name = right click on className> Rename symbol
class QR_codeBox extends StatefulWidget {
  const QR_codeBox({Key? key}) : super(key: key);

  @override
  _QR_codeBoxState createState() => _QR_codeBoxState();
}

class _QR_codeBoxState extends State<QR_codeBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: myQRCode()),
            SizedBox(
              height: 40,
            ),
            Text(
              "hms",
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 40.0,
              ),
            ),
            Text(
              "Print this QR code on a paper, \nso that students can mark their \nattendance by scanning this",
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
                fontSize: 15.0,
              ),
            ),
          ],
        ));
  }

  myQRCode() {
    return QrImage(
      data: "hms",
      size: 200,
      backgroundColor: Colors.white,
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "Scan QR", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }
}
