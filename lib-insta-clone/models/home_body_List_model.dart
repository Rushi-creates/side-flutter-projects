
class ImgPost {

  final String profName ;
  final String profImg ;
  final String mainImgURL ;
  final bool isLiked  ;
  final String totalLikes ;
  final String postedAgo ;

  ImgPost({this.profName : "dummyName", this.profImg : "dummyUrl",
    this.mainImgURL : "dummyUrl", this.isLiked :false ,
    this.totalLikes : " 5,453,432 ", this.postedAgo : "55" }) ;

}

List<ImgPost> dummyList = [
  ImgPost(
      profName: "rushi_creates" ,
      profImg: "https://pbs.twimg.com/profile_images/1408283521635041285/8J1ScfQl_400x400.jpg" ,
      mainImgURL: "https://21ym1q1oz7l4ipi243grtd61-wpengine.netdna-ssl.com/wp-content/uploads/2016/02/13896774597_caa020597e_z-400x400.jpg" ,
      isLiked: true ,
      totalLikes: "426,783" ,
      postedAgo: "4 "
  ) ,
  ImgPost(
      profName: "zayn_malik" ,
      profImg: "https://i.guim.co.uk/img/media/5a67422da7dde372efb1b175dda815d9020268c3/0_136_3600_2160/master/3600.jpg?width=1020&quality=85&auto=format&fit=max&s=c6053f131c4629c33a6d4c4e1d66df57" ,
      mainImgURL: "https://i.guim.co.uk/img/media/5a67422da7dde372efb1b175dda815d9020268c3/0_136_3600_2160/master/3600.jpg?width=1020&quality=85&auto=format&fit=max&s=c6053f131c4629c33a6d4c4e1d66df57" ,
      isLiked: false ,
      totalLikes: "567,678" ,
      postedAgo: "24 "
  ),
  ImgPost(
      profName: "liam_332" ,
      profImg: "https://www.wonderwall.com/wp-content/uploads/sites/2/2020/07/gettyimages-176203208.jpg?w=700" ,
      mainImgURL: "https://www.wonderwall.com/wp-content/uploads/sites/2/2020/07/gettyimages-176203208.jpg?w=700" ,
      isLiked: true ,
      totalLikes: "6,790" ,
      postedAgo: "28 "
  ),
  ImgPost(
      profName: "michel_b_jordan" ,
      profImg: "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_500,h_600/https://dujour.com/wp-content/uploads/ee6d55bf798f-500x600.jpg" ,
      mainImgURL: "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_500,h_600/https://dujour.com/wp-content/uploads/ee6d55bf798f-500x600.jpg" ,
      isLiked: false ,
      totalLikes: "36,749" ,
      postedAgo: "31 "
  ),
  ImgPost(
      profName: "louis_tomillson" ,
      profImg: "https://static.wikia.nocookie.net/louistomlinson/images/d/d8/Louis_Tomlinson_leaked_photoshoot_June_2020_-_2.jpeg/revision/latest?cb=20200701064701" ,
      mainImgURL: "https://static.wikia.nocookie.net/louistomlinson/images/d/d8/Louis_Tomlinson_leaked_photoshoot_June_2020_-_2.jpeg/revision/latest?cb=20200701064701" ,
      isLiked: false ,
      totalLikes: "456" ,
      postedAgo: "39"
  ),
  ImgPost(
      profName: "harry_style342" ,
      profImg: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/harry-styles-arriving-at-the-dunkirk-world-premiere-at-news-photo-1574431134.jpg" ,
      mainImgURL: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/harry-styles-arriving-at-the-dunkirk-world-premiere-at-news-photo-1574431134.jpg" ,
      isLiked: true ,
      totalLikes: "21,672" ,
      postedAgo: "48 "
  ) ,
  ImgPost(
      profName: "rushi_creates" ,
      profImg: "https://pbs.twimg.com/profile_images/1408283521635041285/8J1ScfQl_400x400.jpg" ,
      mainImgURL: "https://i.pinimg.com/564x/23/67/99/236799fccee442089601957449eb0aae.jpg" ,
      isLiked: true ,
      totalLikes: "426,783" ,
      postedAgo: "4 "
  ) ,
  ImgPost(
      profName: "zayn_malik" ,
      profImg: "https://i.guim.co.uk/img/media/5a67422da7dde372efb1b175dda815d9020268c3/0_136_3600_2160/master/3600.jpg?width=1020&quality=85&auto=format&fit=max&s=c6053f131c4629c33a6d4c4e1d66df57" ,
      mainImgURL: "https://i.guim.co.uk/img/media/5a67422da7dde372efb1b175dda815d9020268c3/0_136_3600_2160/master/3600.jpg?width=1020&quality=85&auto=format&fit=max&s=c6053f131c4629c33a6d4c4e1d66df57" ,
      isLiked: false ,
      totalLikes: "567,678" ,
      postedAgo: "24 "
  ),
  ImgPost(
      profName: "liam_332" ,
      profImg: "https://www.wonderwall.com/wp-content/uploads/sites/2/2020/07/gettyimages-176203208.jpg?w=700" ,
      mainImgURL: "https://www.wonderwall.com/wp-content/uploads/sites/2/2020/07/gettyimages-176203208.jpg?w=700" ,
      isLiked: true ,
      totalLikes: "6,790" ,
      postedAgo: "28 "
  ),
  ImgPost(
      profName: "michel_b_jordan" ,
      profImg: "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_500,h_600/https://dujour.com/wp-content/uploads/ee6d55bf798f-500x600.jpg" ,
      mainImgURL: "https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_500,h_600/https://dujour.com/wp-content/uploads/ee6d55bf798f-500x600.jpg" ,
      isLiked: false ,
      totalLikes: "36,749" ,
      postedAgo: "31 "
  ),
  ImgPost(
      profName: "louis_tomillson" ,
      profImg: "https://static.wikia.nocookie.net/louistomlinson/images/d/d8/Louis_Tomlinson_leaked_photoshoot_June_2020_-_2.jpeg/revision/latest?cb=20200701064701" ,
      mainImgURL: "https://static.wikia.nocookie.net/louistomlinson/images/d/d8/Louis_Tomlinson_leaked_photoshoot_June_2020_-_2.jpeg/revision/latest?cb=20200701064701" ,
      isLiked: false ,
      totalLikes: "456" ,
      postedAgo: "39"
  ),
  ImgPost(
      profName: "harry_style342" ,
      profImg: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/harry-styles-arriving-at-the-dunkirk-world-premiere-at-news-photo-1574431134.jpg" ,
      mainImgURL: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/harry-styles-arriving-at-the-dunkirk-world-premiere-at-news-photo-1574431134.jpg" ,
      isLiked: true ,
      totalLikes: "21,672" ,
      postedAgo: "48 "
  ),
] ;