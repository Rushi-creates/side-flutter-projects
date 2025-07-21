class ChatListModel {
  final String name;

  final String message;

  final String time;

  final String avatarUrl;

  ChatListModel(
      {this.name = "rushi ",
      this.message = "implicitly written",
      this.time = "0:00",
      this.avatarUrl =
          "https://pbs.twimg.com/profile_images/997583564802805761/Lu8k1FM__400x400.jpg"});
}

List<ChatListModel> dummyData = [
  new ChatListModel(
      name: "Rushi",
      message: "Hello there  ",
      time: "2:24 ",
      avatarUrl:
          "https://i.pinimg.com/564x/23/67/99/236799fccee442089601957449eb0aae.jpg"),
  new ChatListModel(
      name: "Weeknd",
      message: "Just released new hit  ",
      time: "8:45 ",
      avatarUrl:
          "https://music.kaminari.info/wp-content/uploads/2020/02/The-Weeknd.jpg"),
  new ChatListModel(
      name: "Zayn ",
      message: "Cause You and I",
      time: "6:15 ",
      avatarUrl:
          "https://pbs.twimg.com/profile_images/997583564802805761/Lu8k1FM__400x400.jpg"),
  new ChatListModel(
      name: "Liam ",
      message: "Night changes ",
      time: "4:55 ",
      avatarUrl:
          "https://pbs.twimg.com/profile_images/1403412995565314051/3Ulj59S_.jpg"),
  new ChatListModel(
      name: "Niall ",
      message: "This town",
      time: "8:35 ",
      avatarUrl:
          "https://pbs.twimg.com/profile_images/1326994746087256066/WwoIMqJB_400x400.jpg"),
  new ChatListModel(
      name: "Louis ",
      message: "Back to you",
      time: "5:15 ",
      avatarUrl:
          "https://i.pinimg.com/474x/b7/a2/3b/b7a23b69b6a00bb5d0df58b7db3e58fb.jpg"),
  new ChatListModel(
      name: "Twenty One Pilots  ",
      message: "Stressed Out",
      time: "6:23 ",
      avatarUrl:
          "https://beelody.com/wp-content/uploads/2018/12/This-Is-Twenty-One-Pilots-400x400.jpg"),
  new ChatListModel(
      name: "Post Malone  ",
      message: "White Inversion",
      time: "1:18 ",
      avatarUrl:
          "https://i.pinimg.com/474x/ac/73/3d/ac733daa9c26e292fc734db0228e0c49.jpg"),
  new ChatListModel(
      name: "Mr.Kitty ",
      message: "After Dark",
      time: "7:19 ",
      avatarUrl:
          "https://is2-ssl.mzstatic.com/image/thumb/Music124/v4/f7/10/3d/f7103d37-f538-0931-6565-248e6532035e/616450974909.png/400x400cc.jpg"),
  new ChatListModel(
      name: "Ariana ", message: "God is a woman", time: "8:57 ", avatarUrl: "https://pbs.twimg.com/profile_images/1385463321789452288/trz65E6m.jpg"),
  new ChatListModel(
      name: "Harry ",
      message: "Watermelon sugar high ",
      time: "9:01 ",
      avatarUrl:
          "https://i.pinimg.com/474x/9e/72/95/9e7295e5a0837e64a261023caaff9cd6.jpg")
];
