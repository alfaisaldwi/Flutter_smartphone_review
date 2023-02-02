import 'dart:developer';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartphone_review/app/modules/home/views/home_view.dart';

class LoginPageController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController c_email = TextEditingController();
  TextEditingController c_pw = TextEditingController();
    User? user;

  FirebaseAuth auth = FirebaseAuth.instance;
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Stream<User?> get firebaseUserStream => auth.authStateChanges();
  void asignOutUser() {
    auth.signOut();
  }

  Future<User?> loginGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
   

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);
          user = userCredential.user;
          Get.toNamed('home');
          print('-----------------------------------$user-----------');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
          } else if (e.code == 'invalid-credential') {
            // ...
          }
        } catch (e) {
          // ...
        }
      }
    }

    return user;
  }
}
  
  
  
  
  //   if (_firebaseAuth.currentUser!.email != null) {
  //     print(_firebaseAuth.currentUser!.email);
  //     Get.to(() => HomeView());
  //   } else {
  //     await _googleSignIn.signIn().then((value) {
  //       String username = value!.displayName!;
  //       String profilePicture = value.photoUrl!;
  //       print('$username');
  //       Get.to(() => HomeView());
  //     });
  //   }
  // }

