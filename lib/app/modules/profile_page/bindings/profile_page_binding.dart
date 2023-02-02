import 'package:get/get.dart';
import 'package:smartphone_review/app/modules/login_page/controllers/login_page_controller.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePageController>(
      () => ProfilePageController(),
    );
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}
