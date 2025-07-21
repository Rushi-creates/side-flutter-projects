import 'package:flutter/material.dart';
import 'package:hostel_management_system/test_provider/counterBackend.dart';
import 'package:provider/provider.dart';

//to change class name = right click on className> Rename symbol
class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // var BackendCodeObj =  Provider.of<CounterBackend>( context, listen:false) ;

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
          Center(
            child: counterText(),
          ),
          controlButtons(),
        ],
      ),
    );
  }

  Padding counterText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.greenAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<CounterBackend>(builder: (context, dataArg, child) {
            return Text(
              dataArg.holdNumber.toString(),
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueAccent,
                // decoration: TextDecoration.none,
                // fontStyle: FontStyle.italic,
                // fontFamily: "FontNameHere" ,
                fontWeight: FontWeight.bold,
                // fontWeight: FontWeight.w300,
                fontSize: 40.0,
              ),
            );
          }),
        ),
      ),
    );
  }

  controlButtons() {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  "Increment",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
                onPressed: () {
                  Provider.of<CounterBackend>(context, listen: false)
                      .incrementNumber();
                },
              ),
              SizedBox(
                width: 90,
              ),
              TextButton(
                child: Text(
                  "Decrement",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
                onPressed: () {
                  Provider.of<CounterBackend>(context, listen: false)
                      .decrementNumber();
                },
              ),
            ],
          ),
          SizedBox(
            height: 40, //(0.04/screen height)
          ),
          TextButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
            onPressed: () {
              Provider.of<CounterBackend>(context, listen: false).resetNumber();
            },
          ),
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
        "Counter", //give here appBar title
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
