//create model class to group userData inside one modelObj

class ImgPostModel {
  String postId, imgUrl, ownerId, captionController;
  DateTime timeStamp;

  ImgPostModel(
      {required this.postId,
      required this.imgUrl,
      required this.ownerId,
      required this.captionController,
      required this.timeStamp});

/* -------------------------------------------------------------------------- */
/*                     //! ToMap func &  fromMap const                        */
/* -------------------------------------------------------------------------- */

  Map<String, dynamic> toMap() => {
        "postId": postId,
        "imgUrl": imgUrl,
        "ownerId": ownerId,
        "captionController": captionController,
        "timeStamp": timeStamp,
      };

  factory ImgPostModel.fromMap(Map<String, dynamic> arg) => ImgPostModel(
      postId: arg["postId"],
      imgUrl: arg["imgUrl"],
      ownerId: arg["ownerId"],
      timeStamp: arg["timeStamp"],
      captionController: arg["captionController"]);
}
