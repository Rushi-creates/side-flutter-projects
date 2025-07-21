//this provider class , contains all the Firebase functions , to call in other UI class

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignProvider extends ChangeNotifier {
/* -------------------------------------------------------------------------- */
/*                            //! Class declaration                           */
/* -------------------------------------------------------------------------- */
  final googleSignInObj = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!; //getter for above user var

/* -------------------------------------------------------------------------- */
/*                              //! Login method                              */
/* -------------------------------------------------------------------------- */

  Future googleLogin() async {
    try {
      final googleUser = await googleSignInObj.signIn();
      if (googleUser == null)
        return; //makes sure user has confirmly selected one account
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      var result = await FirebaseAuth.instance.signInWithCredential(credential);
      return result;
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

/* -------------------------------------------------------------------------- */
/*                              //! Logout method                             */
/* -------------------------------------------------------------------------- */

  Future logout() async {
    await googleSignInObj.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
