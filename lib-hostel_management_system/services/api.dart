import 'dart:async';
import 'dart:convert';

import 'package:hostel_management_system/global.dart';
import 'package:hostel_management_system/models/loginUser.dart';
import 'package:hostel_management_system/models/userModel.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
/* -------------------------------------------------------------------------- */
/*                      //! Making class singleton                            */
/* -------------------------------------------------------------------------- */

  ApiHelper._instance();

  static final ApiHelper apiHelperObj = ApiHelper._instance();

/* -------------------------------------------------------------------------- */
/*                            //!    3 crud                                   */
/* -------------------------------------------------------------------------- */
  Client client = http.Client();

  myDeleteApi(urlArg, modelObjIdProp) async {
    await client.delete(
      Uri.parse(urlArg + modelObjIdProp.toString() + "/delete"),
    );
    print(modelObjIdProp.id.toString());
    print(Uri.parse(urlArg + modelObjIdProp.toString() + "/delete"));
    // print('api obj deleted = $deletedData ');
    // return deletedData;
    // myFetchApi();
  }

  newTrialDeleteApi(modelIdArg) async {
    Response response = await client.get(
      Uri.parse(
          'https://hostelmngsys.herokuapp.com/students/delete/$modelIdArg/'),
    );
    print(response.statusCode);
    print(response);
  }

  // myPostApi(urlArg, modelObjArg) async {
  //   var postedData =
  //       await client.post(Uri.parse(urlArg), body: modelObjArg.toMap());
  //   print('api obj posted = $postedData ');
  //   return postedData;
  // }

  myPostApi(urlArg, modelObjArg) async {
    // var postedData =
    await client.post(
      Uri.parse(urlArg),
      body: modelObjArg.toMap(),
    );
    // print('api obj posted = $postedData ');
    // return postedData;
  }

// //!trial post
//   myPostApi(urlArg, modelObjArg) async {
//     // var postedData =
//     await client.post(
//       Uri.parse(urlArg),
//       body: {
//         'id': 9.toString(),
//         'name': 'rohan',
//         'email': 'rohan@gmail.com',
//         'address': 'virar',
//         'phone': 'ajdk',
//         'room_number': 'mynaj',
//         'hostel_fees': 'kajdf',
//         'mess_fees': 'ljdlf',
//       },
//     );
//     // print('api obj posted = $postedData ');
//     // return postedData;
//   }

//trial
  // void myUpdateApi(urlArg, modelObjArg, modelObjIdProp) {
  //   client.put(Uri.parse(urlArg), body: modelObjArg.toMap());

  //   // client.put(urlArg + modelObjArg.id + "/", body: modelObjArg.toMap());
  //   print('api obj updated');
  // }

// //! this is a trial post method on another api - https://reqres.in/api/users
//   Future createUser() async {
//     UserModel myUser = UserModel(name: 'mynamezz', job: "hahahah");
//     final response = await client.post(Uri.parse("https://reqres.in/api/users"),
//         body: myUser.toMap());
//     if (response.statusCode == 201) {
//       print(response.statusCode);
//       print(response.body);
//     }
//   }

//! changes made
/*
  - added slash in update url
  - wrapped json.encode around modelObj.toMap()
  - wrapped [] around modelObj.toMap()
  - added headers section
*/

  myUpdateApi(urlArg, modelObjArg, modelObjIdProp) async {
    // await client.put(Uri.parse(urlArg + modelObjArg.id + "/"),

    //! og
    var response = await client.post(Uri.parse(urlArg),
        body: json.encode([modelObjArg.toMap()]),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        });

    print('api obj updated');
    print(json.encode([modelObjArg.toMap()]));
    // print(modelObjArg.toMap().toString());
    print('STATUS CODE =========>      \n${response.statusCode}');
    // print(json.decode(response.body));
    print('RESPONSE BODY=========>      \n${response.body}');
    print('BODY BYTES=========>      \n${response.bodyBytes}');
    print('HEADERS=========>      \n${response.headers}');
    print('ISREDIRECT=========>      \n${response.isRedirect}');
    print(
        'PERSITENT CONNECTION=========>      \n${response.persistentConnection}');
    // here
    print('REASON PHRASE=========>      \n${response.reasonPhrase}');
    print('REQUEST=========>      \n${response.request}');
    print('CONTENT LENGTH=========>      \n${response.contentLength}');
  }

/* -------------------------------------------------------------------------- */
/* //!  we dont use this, we directly paste the future builder with fetch code*/
/*   in it from snipit.io , still if we want we can use below lengthy method */
/*  //! we need to write this code in class where we call this fetch function */
/* -------------------------------------------------------------------------- */
  //   @override
  // void initState() {
  //   getRows();
  //   super.initState();
  // }

  // getRows() async {
  //   myList = await ApiHelper.apiHelperObj
  //       .myFetchApi(StudentModel.fromMap, get_students, myList);
  //   if (mounted) setState(() {});
  // }

  // //! then directly call this method
  // myFetchApi(
  //     passModelClassNameWithfromMap, retrieveUrlArg, passEmptylist) async {
  //   //declare the passEmpyList in class where we want to call this function
  //   // ( which is a empty list to store the fetched data)
  //   passEmptylist = [];
  //   List response = json.decode((await client.get(retrieveUrlArg)).body);
  //   response.forEach((element) {
  //     passEmptylist.add(passModelClassNameWithfromMap(element));
  //   });
  //   print('fetched');
  //   print(passEmptylist);
  //   return passEmptylist;

  /* -------------------------------------------------------------------------- */
  /*                                //! fetch end                               */
  /* -------------------------------------------------------------------------- */

  addloginUser() async {
    loginUser lu =
        loginUser(email: 'varadp763@gmail.com', password: 'testuser1234');

    Response response = await client.post(Uri.parse(addLogin_user),
        // body: json.encode([
        //   {'email': 'varadp763@gmail.com', 'password': 'testuser1234'}
        // ]),
        body: json.encode([lu.toMap()]),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        });
    // print(json.encode([modelObjArg.toMap()]));
    // print(modelObjArg.toMap().toString());
    print('STATUS CODE =========>      \n${response.statusCode}');
    print(response.runtimeType);
    // print(loginUser.fromMap([response] as Map<String, dynamic>));
    List<loginUser> myNewList = [];

    if (response.statusCode == 200) {
      print('status code 200');
      List storeResponse = json.decode(response.body);
      storeResponse.forEach((element) {
        myNewList.add(loginUser.fromMap(element));
        print(element);
      });
      // setState(() {});
    } else {
      print('response not fetched - status code != 200');
      throw Exception('Failed to load album');
    }
  }
}
