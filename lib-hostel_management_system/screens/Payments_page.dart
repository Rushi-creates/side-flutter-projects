import 'package:flutter/material.dart';
import 'package:hostel_management_system/models/hostel_fees_model.dart';
import 'package:hostel_management_system/models/mess_fees_model.dart';

//to change class name = right click on className> Rename symbol
class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  // Client client = http.Client();
  List<dynamic> myList = [];

  // myFetchApi() async {
  //   myList = [];
  //   List response = json.decode((await client.get(get_students)).body);
  //   // print(response);
  //   response.forEach((element) {
  //     myList.add(StudentModel.fromMap(element));
  //   });
  //   setState(() {});
  // }

  // void myDeleteApi() {
  //   client.delete(url);
  //   myFetchApi();
  // }

  // void myPostApi() {
  //   client.post(url,body: passJsonData);
  // }

  // void myUpdateApi() {
  //   client.put(url, passJsonData);
  // }

  @override
  Widget build(BuildContext context) {
    var dimVar = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white24,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              payFeesCard(),
              SizedBox(
                height: dimVar.height * 0.05, //(0.04/screen height)
              ),
              payMessFeesCard(),
              // createFetchingList(),
              // myFetchApi(),
            ],
          ),
        ));
  }

  createFetchingList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: myList.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(myList[i].name!),
        );
      },
    );
  }

  payFeesCard() {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Pay fees",
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  // decoration: TextDecoration.none,
                  // fontStyle: FontStyle.italic,
                  // fontFamily: "FontNameHere" ,
                  fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.w300,
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: dimVar.width * 0.5,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Select Number of years"),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text(
                  "Pay amount",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
                onPressed: () {
                  storeHostelFeesToApi();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  storeHostelFeesToApi() {
    HostelFeesModel hfModel = HostelFeesModel(
        studentName:
            "studentName", // take data here and convert it from json to dart value
        isFeesPaid: true,
        paymentDate: DateTime.now().day.toString());

    // post(urlHere,hfModel.toMap());  // post to api url
  }

  storeMessFeesToApi() {
    MessFessModel mfModel = MessFessModel(
        studentName:
            "studentName", // take data here and convert it from json to dart value
        isFeesPaid: true,
        paymentDate: DateTime.now().day.toString());
    // post(urlHere,hfModel.toMap());  // post to api url
  }

  payMessFeesCard() {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Pay mess fees",
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  // decoration: TextDecoration.none,
                  // fontStyle: FontStyle.italic,
                  // fontFamily: "FontNameHere" ,
                  fontWeight: FontWeight.bold,
                  // fontWeight: FontWeight.w300,
                  fontSize: 25.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: dimVar.width * 0.5,
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Select amount "),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text(
                  "Pay amount",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
                onPressed: () {
                  storeMessFeesToApi();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      // elevation: 0.0,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back,
      //     color: Colors.black,
      //   ),
      //   onPressed: null,
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        'Payments', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: IconButton(
      //         onPressed: null,
      //         icon: Icon(
      //           Icons.search,
      //           color: Colors.black,
      //         )),
      //   )
      // ],
    );
  }
}
