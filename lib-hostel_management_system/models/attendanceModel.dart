//create model class to group userData inside one modelObj

class AttendaceModel {
  String userName;
  String userEmail;
  bool isPresent;
  DateTime currentTime;
  // String check_in_time;
  // String check_out_time;

  AttendaceModel({
    // required this.check_in_time,
    // required this.check_out_time,
    required this.userName,
    required this.userEmail,
    required this.isPresent,
    required this.currentTime,
  });

// /* -------------------------------------------------------------------------- */
// /*                     //! ToMap func &  fromMap const                        */
// /* -------------------------------------------------------------------------- */

  Map<String, dynamic> toMap() => {
        "userName": userName,
        "userEmail": userEmail,
        "isPresent": isPresent,
        "currentTime": currentTime,
      };

  factory AttendaceModel.fromMap(Map<String, dynamic> arg) => AttendaceModel(
        userName: arg["userName"],
        userEmail: arg["userEmail"],
        isPresent: arg["isPresent"],
        currentTime: arg["currentTime"],
      );
}
