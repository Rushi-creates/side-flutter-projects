import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class EmployeeAPi {
  EmployeeAPi._instance();

  static final EmployeeAPi apiHelperObj = EmployeeAPi._instance();

/* -------------------------------------------------------------------------- */
/*                            //!    3 crud                                   */
/* -------------------------------------------------------------------------- */
  Client client = http.Client();

  addEmployee(urlArg, modelObjArg) async {
    try {
      var myResponse = await client.post(
        Uri.parse(urlArg),
        body: modelObjArg.toMap(),
      );
      print(myResponse.body);
    } catch (e) {
      print(e); // use a dialog/snackbar , to show user the error
    }
  }

  myUpdateApi(urlArg, modelObjArg) async {
    try {
      var myResponse = await client.put(
          Uri.parse(urlArg + "/" + modelObjArg.id.toString()),
          body: modelObjArg.toMap());
      print(myResponse.body);
    } catch (e) {
      print(e); // use a dialog/snackbar , to show user the error
    }
  }

  deleteEmployee(urlArg, modelObj_Idprop) async {
    try {
      var myResponse = await client.delete(
        Uri.parse(urlArg + "/" + modelObj_Idprop.toString()),
      );
      print('this is the response code ${myResponse.statusCode}');
      print('if empty braces are empty here ===> ${myResponse.body}'
          ' means Object at this id =====> $modelObj_Idprop is deleted');
    } catch (e) {
      print(
          'this is the error ====> $e'); // use a dialog/snackbar , to show user the error
    }
  }
}
