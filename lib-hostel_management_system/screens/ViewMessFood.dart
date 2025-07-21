import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hostel_management_system/global.dart';
import 'package:hostel_management_system/screens/Add_mess_food.dart';
import 'package:hostel_management_system/services/firestoreDB.dart';

//to change class name = right click on className> Rename symbol
class ViewMessFood extends StatefulWidget {
  const ViewMessFood({Key? key}) : super(key: key);

  @override
  _ViewMessFoodState createState() => _ViewMessFoodState();
}

class _ViewMessFoodState extends State<ViewMessFood> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: currentUser.email.toString() == wardenEmail
            ? FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.purple,
                // tooltip: "Hint text on hover ",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddMessFood();
                  }));
                },
              )
            : null,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              fetchStreamCollec_MessFoodMenu(),
            ],
          ),
        ));
  }

//!change this funcsName

  fetchStreamCollec_MessFoodMenu() {
/* -------------------------------------------------------------------------- */
/*      //! Fetching any collection , whose path we mention below as req      */
/*           //! Displaying fetch Collection using ListView.builder           */
/*     //? inside scaffold's body prop , or wherever we want to display       */
/* -------------------------------------------------------------------------- */

    return StreamBuilder<QuerySnapshot>(
        //Todo: pass here the 'whole' fetching path of 'collection' from firebase
        stream:
            FirebaseFirestore.instance.collection('Mess Food Menu').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            Center(child: Text("Something went wrong: ${snapshot.error}"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.data == null) {
            return Text("No data yet");
          }

          /* -------------------------------------------------------------------------------------- */
          /* //!  if data is fetched properly, then store it in docsListName (1 doc = 1 docListName)*/
          /* -------------------------------------------------------------------------------------- */

          final List docsListName = [];

          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            docsListName.add(a);

            /* -------------------------------------------------------------------------- */
            /*    //! storing name/id of document , inside its own doc body , as a key    */
            /* -------------------------------------------------------------------------- */
            //this 'idKEY' string is imp , use it as actual arg, to pass in delete,update crud
            a['idKEY'] = document.id;
          }).toList();

          //write any other req logic here to manipulate docsListName , before displaying

          /* -------------------------------------------------------------------------- */
          /*  //? displaying all key-values , from docNameList , using ListView.builder */
          /* -------------------------------------------------------------------------- */

          //Todo: change UI here , and display data as req
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: docsListName.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
                child: Card(
                  child: ListTile(
                    tileColor: Colors.pink,
                    //Todo: paste the KEY names (in 'string') ,from firestore documents
                    title: Text(docsListName[i]['name']),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.black,
                      // backgroundImage: NetworkImage("url_here"),
                      // radius: 25.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          var myPath = FirebaseFirestore.instance
                              .collection('Mess Food Menu')
                              .doc('idKEY');
                          DBHelper.dbHelperObj.delete(myPath);
                        },
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(docsListName[i]['description']),
                        Spacer(),
                        Text(
                          '${docsListName[i]['price']}  Rs',
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
                            // fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                    onTap: null,
                  ),
                ),
              );
            },
          );
        });
  }

  AppBar myHeader() {
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
          Navigator.pop(context);
        },
      ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "Mess food menu", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
        )
      ],
    );
  }
}
