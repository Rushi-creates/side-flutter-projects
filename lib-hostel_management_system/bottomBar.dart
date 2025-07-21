// //MAKE SURE YOU CALL THIS CLASS , IN main.dart
// import 'package:flutter/material.dart';
// import 'screens/Create_page.dart';
// import 'screens/Attendance_page.dart';
// import 'screens/UploadCards.dart';
// import 'screens/Profile.dart';

// class BottomBar extends StatefulWidget {
//   const BottomBar({Key? key}) : super(key: key);

//   @override
//   _BottomBarState createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar>
//     with AutomaticKeepAliveClientMixin {
//   PageController _pageControllerObj = PageController();

//   int _selectedIndex = 0;

//   @override
//   bool get wantKeepAlive => true;

//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return Scaffold(
//         body: PageView(
//           physics: NeverScrollableScrollPhysics(),
//           controller: _pageControllerObj,
//           children: [AttendancePage(), CreatePosts(), UploadCards(), Profile()],
//           onPageChanged: (_index) {
//             setState(() {
//               _selectedIndex = _index;
//             });
//           },
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Colors.white,
//           elevation: 0.0,
//           // backgroundColor:  Color(0xffFBEBC2)  ,
//           onTap: (selectedIndex) {
//             _pageControllerObj.jumpToPage(selectedIndex);
//           },

//           items: [
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.scanner,
//                   color: _selectedIndex == 0 ? Color(0xff492A1E) : Colors.grey,
//                 ),
//                 // label: 'Home',
//                 title: Text(
//                   "Attendance",
//                   style: TextStyle(
//                       fontSize: 12,
//                       color: _selectedIndex == 0
//                           ? Color(0xff492A1E)
//                           : Colors.grey),
//                 )),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.payment,
//                     color:
//                         _selectedIndex == 1 ? Color(0xff492A1E) : Colors.grey),
//                 // label: "Shop",
//                 title: Text(
//                   "Payment",
//                   style: TextStyle(
//                       color: _selectedIndex == 1
//                           ? Color(0xff492A1E)
//                           : Colors.grey),
//                 )
//                 // activeIcon: Icon(Icons.height)
//                 ),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.upload_file,
//                   color: _selectedIndex == 2 ? Color(0xff492A1E) : Colors.grey,
//                 ),

//                 // label: "Profile",
//                 title: Text(
//                   "Upload",
//                   style: TextStyle(
//                       color: _selectedIndex == 2
//                           ? Color(0xff492A1E)
//                           : Colors.grey),
//                 )),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.person,
//                   color: _selectedIndex == 3
//                       ? Color(0xff492A1E)
//                       : Colors.grey, //increase here too
//                 ),

//                 // label: "Profile",
//                 title: Text(
//                   "Profile",
//                   style: TextStyle(
//                       color: _selectedIndex ==
//                               3 //just increase this num by one everytime we copy bottombar item
//                           ? Color(0xff492A1E)
//                           : Colors.grey),
//                 )),
//           ],
//         ));
//   }
// }

//MAKE SURE YOU CALL THIS CLASS , IN main.dart

import 'package:flutter/material.dart';
import 'package:hostel_management_system/screens/Payments_page.dart';
import 'package:hostel_management_system/screens/UploadCards.dart';
import 'package:hostel_management_system/test_provider/counterScreen.dart';
import 'package:hostel_management_system/test_provider/pickImageCards.dart';
import 'screens/Create_page.dart';
import 'screens/UserAttendanceScreen.dart';
import 'screens/Profile.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with AutomaticKeepAliveClientMixin {
  PageController _pageControllerObj = PageController();

  int _selectedIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageControllerObj,
          children: [UploadCards(), UserAttendanceScreen(), Profile()],
          onPageChanged: (_index) {
            setState(() {
              _selectedIndex = _index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          // backgroundColor:  Color(0xffFBEBC2)  ,
          onTap: (selectedIndex) {
            _pageControllerObj.jumpToPage(selectedIndex);
          },

          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.library_books_rounded,
                  color: _selectedIndex == 0 ? Color(0xff492A1E) : Colors.grey,
                ),
                // label: 'Home',
                title: Text(
                  "Attendance",
                  style: TextStyle(
                      fontSize: 12,
                      color: _selectedIndex == 0
                          ? Color(0xff492A1E)
                          : Colors.grey),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment,
                    color:
                        _selectedIndex == 1 ? Color(0xff492A1E) : Colors.grey),
                // label: "Shop",
                title: Text(
                  "Payments",
                  style: TextStyle(
                      color: _selectedIndex == 1
                          ? Color(0xff492A1E)
                          : Colors.grey),
                )
                // activeIcon: Icon(Icons.height)
                ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: _selectedIndex == 2 ? Color(0xff492A1E) : Colors.grey,
                ),

                // label: "Profile",
                title: Text(
                  "Profile",
                  style: TextStyle(
                      color: _selectedIndex == 2
                          ? Color(0xff492A1E)
                          : Colors.grey),
                )),

            // BottomNavigationBarItem(
            // icon: Icon(
            //   Icons.person,
            //   color: _selectedIndex == 3 ? Color(0xff492A1E) : Colors.grey, //increase here too
            // ),

            // // label: "Profile",
            // title: Text(
            //   "Profile",
            //   style: TextStyle(
            //       color: _selectedIndex == 3 //just increase this num by one everytime we copy bottombar item
            //           ? Color(0xff492A1E)
            //           : Colors.grey),
            // )) ,
          ],
        ));
  }
}
