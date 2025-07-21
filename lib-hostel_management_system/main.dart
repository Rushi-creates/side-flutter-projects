import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hostel_management_system/Warden.dart/Warden_panel.dart';
import 'package:hostel_management_system/test_provider/counterBackend.dart';
import 'package:hostel_management_system/test_provider/old_hardware.dart';
import 'package:hostel_management_system/test_provider/new_UploadCards.dart';
import '../screens/AdminPage.dart';
import 'global.dart';
import 'package:provider/provider.dart';
import 'provider/auth_provider.dart';
import 'screens/SignIn.dart';
import 'bottomBar.dart';

/* -------------------------------------------------------------------------- */
/*                      //! 2 lines added in main() func                      */
/* -------------------------------------------------------------------------- */
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

/* -------------------------------------------------------------------------- */
/*                               //! MyApp class                              */
/* -------------------------------------------------------------------------- */

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  //used as future obj in FutureBuilder widget below, to make connection with Firebase services
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
/* -------------------------------------------------------------------------- */
/*     //! returning future builder , if app isn't connected to firebase      */
/* -------------------------------------------------------------------------- */
    return FutureBuilder(
      future: _initialization, //above declared Firebase object
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something is wrong");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

/* -------------------------------------------------------------------------- */
/*         //! changeNotifierProvider wrapped aroun MaterialApp widget        */
/* -------------------------------------------------------------------------- */
        return ChangeNotifierProvider(
          create: (context) =>
              GoogleSignProvider(), //Todo: change class name here
          child: MaterialApp(
            title: 'Flutter demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: ChangeNotifierProvider<HardwareBackend>(
              create: (context) =>
                  HardwareBackend(), //Todo: change class name here
              child: authDecider(),
            ),
          ),
        );
      },
    );
  }

  /* -------------------------------------------------------------------------- */
  /*                           //! auth decider method                          */
  /* -------------------------------------------------------------------------- */

  // custom Function that will navigate to home screen ( also next time when user opens the app ,
  // it will directly nav to home screen) , if user is signedin already , else will show signin screen ,
  // to sign in a new user , called in home property above

  authDecider() {
    return StreamBuilder(
      stream: FirebaseAuth.instance
          .authStateChanges(), //this is responsible to check whether the user is authenticated or not  , its response is stored in snapshot , for us to use
      builder: (context, snapshot) {
        //if firebase is still authenticating , then show a circular loader
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        //if there is some kinda error in authenticating , then show this message
        else if (snapshot.hasError) {
          return Center(child: Text('Something went wrong! '));
        }

        //If the user authentication is succeeded by firebase , then go to Home page( first screen of app )
        else if (snapshot.hasData) {
          final currentUser = FirebaseAuth.instance.currentUser!;
          if (currentUser.email.toString() == adminEmail) {
            return AdminPage();
          } else if (currentUser.email.toString() == wardenEmail) {
            return WardenPanel();
          } else {
            // return MultiProvider(providers: [
            //   Provider<CounterBackend>(create: (context) => CounterBackend()),
            //   // Provider<ClassTwo>(create: (context) => classTwo()),
            //   // Provider<ClassThree>(create: (context) => classThree()),
            // ], child: BottomBar());

            return ChangeNotifierProvider(
                // context of BackendCode obj , is stored here , and can be used by any child screen class , inside the scope of FirstHomePageClass
                create: (context) => CounterBackend(),
                child: BottomBar());

            //Todo : pass here the first screen of app ( BottomBar if needed )
          }
        }

        //If the user is NOT authenticated by firebase, then it shows the  SignUp page for user to select an account
        // ( this is the same page , which contains signIn button )
        //this happens , for the first time when user opens the app  OR   when the user logsOut of the app
        else {
          return SignInScreen();
        }
      },
    );
  }
}
