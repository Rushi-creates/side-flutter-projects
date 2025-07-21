import 'package:flutter/material.dart';
import 'package:instagram_clone/Screens/Insta_home_page/Insta_home.dart';

class CommonPage extends StatefulWidget {
  final String arg1;

  const CommonPage({Key? key, this.arg1="default value "}) : super(key: key);

  const CommonPage.named( this.arg1) ;

  @override
  _CommonPageState createState() => _CommonPageState(arg1);
}

class _CommonPageState extends State<CommonPage> {
  final String arg1;

  _CommonPageState(this.arg1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(arg1),
        leading: Icon(Icons.arrow_back),
      ),


      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    child: Icon(Icons.home),
                    onTap: () =>
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return InstaHome();
                          }),

                        )),
                GestureDetector(
                    child: Icon(Icons.search),
                    onTap: () =>
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return InstaHome();
                          }),
                        )),
                GestureDetector(
                    child: Icon(Icons.add_box_outlined),
                    onTap: () =>
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return InstaHome();
                          }),
                        )),
                GestureDetector(
                    child: Icon(Icons.favorite),
                    onTap: () =>
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return InstaHome();
                          }),
                        )

                ),
                GestureDetector(
                    child: Icon(Icons.person),
                    onTap: () =>
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return InstaHome();
                          }),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }

}



