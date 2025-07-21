//create model class to group userData inside one modelObj

/* -------------------------------------------------------------------------- */
/*              //! Create a modelClass, to model a userData/post             */
/*             //? one model will represent one userPost doc in firestore     */
/* -------------------------------------------------------------------------- */

class ProfileModel {
  //these we directly collected from user's email

  String? userName;
  String? bio;
  String? pfpImgUrl;

  ProfileModel({this.userName, this.bio, this.pfpImgUrl});

  Map<String, dynamic> toMap() => {
        //key : value

        "userName": userName,
        "bio": bio,
        "pfpImgUrl": pfpImgUrl
      };

  factory ProfileModel.fromMap(Map<String, dynamic> arg) => ProfileModel(
      userName: arg["userName"], bio: arg["bio"], pfpImgUrl: arg["pfpImgUrl"]);
}
