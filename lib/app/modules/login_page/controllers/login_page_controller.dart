import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartphone_review/app/modules/home/views/home_view.dart';

class LoginPageController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void loginGoogle() async {
    if (_firebaseAuth.currentUser!.email != null) {
      print(_firebaseAuth.currentUser!.email);
      Get.to(() => HomeView());
    } else {
      await _googleSignIn.signIn().then((value) {
        String username = value!.displayName!;
        String profilePicture = value.photoUrl!;
        print('$username');
        Get.to(() => HomeView());
      });
    }
  }
}
