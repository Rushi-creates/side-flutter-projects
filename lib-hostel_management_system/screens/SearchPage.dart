// //Prerequisite : make sure you have completed firebase: auth snipit, then start this



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// //to change class name = right click on className> Rename symbol
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
// class _SearchPageState extends State<SearchPage>
//     with AutomaticKeepAliveClientMixin<SearchPage> {
//   bool doneSearch = false;
//   final currentUser = FirebaseAuth.instance.currentUser!;
//   TextEditingController searchUsersController = TextEditingController();
//   emptyController() {
//     searchUsersController.clear();
//   }
//   AppBar appbarHeader() {
//     return AppBar(
//       backgroundColor: Colors.black,
//       title: TextFormField(
//           style: TextStyle(fontSize: 18.0, color: Colors.white),
//           controller: searchUsersController,
//           decoration: InputDecoration(
//               hintText: "Search exact term....",
//               hintStyle: TextStyle(color: Colors.grey),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.grey),
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.white),
//               ),
//               filled: true,
//               prefixIcon: Icon(
//                 Icons.person_search,
//                 color: Colors.white,
//                 size: 30.0,
//               ),
//               suffixIcon: IconButton(
//                   icon: Icon(
//                     Icons.clear,
//                     color: Colors.white,
//                   ),
//                   onPressed: () => emptyController())),
//           onFieldSubmitted: (value) {
//             setState(() {
//               doneSearch = true;
//             });
//             // print((docsListName.length));
//             // if (docsListName.length == 9) {
//             //   docsListName.removeAt(0);
//             // }
//             // print((docsListName.length));
//           }),
//     );
//   }
//   /* -------------------------------------------------------------------------- */
// /* //! Patse this func outside(above) BUILD method ,later directly call in UI */
// /* -------------------------------------------------------------------------- */
// //!change this funcsName
//   fetchFutureCollec_searchUserName() {
// /* -------------------------------------------------------------------------- */
// /*      //! Fetching any collection , whose path we mention below as req      */
// /*           //! Displaying fetch Collection using ListView.builder           */
// /*     //? inside scaffold's body prop , or wherever we want to display       */
// /* -------------------------------------------------------------------------- */
//     return FutureBuilder<QuerySnapshot>(
//         //Todo: pass here the 'whole' fetching path of 'collection' from firebase
//         future: FirebaseFirestore.instance
//             .collection()  //pass here collectionName , in which we want to search
//             //pass here the fieldName on basis of we want to search ( present in all docs of above collec )
//             .where("fieldName" ,
//                 isGreaterThanOrEqualTo: searchUsersController.text)
//             .get(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasError) {
//             print('Something went Wrong');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: Center(child: CircularProgressIndicator()),
//             );
//           }
//           /* -------------------------------------------------------------------------------------- */
//           /* //!  if data is fetched properly, then store it in docsListName (1 doc = 1 docListName)*/
//           /* -------------------------------------------------------------------------------------- */
//           final List docsListName = [];
//           snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map a = document.data() as Map<String, dynamic>;
//             docsListName.add(a);
//             /* -------------------------------------------------------------------------- */
//             /*    //! storing name/id of document , inside its own doc body , as a key    */
//             /* -------------------------------------------------------------------------- */
//             //this 'idKEY' string is imp , use it as actual arg, to pass in delete,update crud
//             a['idKEY'] = document.id;
//           }).toList();
//           /* -------------------------------------------------------------------------- */
//           /*  //? displaying all key-values , from docNameList , using ListView.builder */
//           /* -------------------------------------------------------------------------- */
//           //Todo: change UI here , and display data as req
//           return SingleChildScrollView(
//             child: ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemCount: docsListName.length,
//               itemBuilder: (context, i) {
//                 return ListTile(
//                   //Todo: paste the KEY names (in 'string') ,from firestore documents
//                   //enter fieldsName , that we want to display in UI of searched docs 
//                   title: Text(docsListName[i][]),
//                   subtitle: Text(docsListName[i][]),
//                   onTap: null,
//                 );
//               },
//             ),
//           );
//         });
//   }
//   @override
//   bool get wantKeepAlive => true;
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: appbarHeader(),
//         body: doneSearch
//             ? fetchFutureCollec_searchUserName()
//             : Center(
//                 child: Text("No searches"),
//               ));
//   }
// }