class AuthUserModel {
  String email;
  String email_uid;
  String? email_displayName;
  String? email_ImageUrl;
  String? email_phoneNo;

  AuthUserModel({
    required this.email,
    required this.email_uid,
    this.email_displayName,
    this.email_ImageUrl,
    this.email_phoneNo,
  });

/* -------------------------------------------------------------------------- */
/*                     //! ToMap func &  fromMap const                        */
/* -------------------------------------------------------------------------- */

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'email_uid': email_uid,
      'email_displayName': email_displayName,
      'email_ImageUrl': email_ImageUrl,
      'email_phoneNo': email_phoneNo,
    };
  }

  factory AuthUserModel.fromMap(Map<String, dynamic> map) {
    return AuthUserModel(
      email: map['email'] ?? '',
      email_uid: map['email_uid'] ?? '',
      email_displayName: map['email_displayName'],
      email_ImageUrl: map['email_ImageUrl'],
      email_phoneNo: map['email_phoneNo'],
    );
  }
}
