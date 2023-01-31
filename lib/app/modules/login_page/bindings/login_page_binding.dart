import 'package:get/get.dart';
import 'package:smartphone_review/app/modules/home/controllers/home_controller.dart';
import 'package:smartphone_review/app/modules/profile_page/controllers/profile_page_controller.dart';
import 'package:smartphone_review/app/modules/smartphone_add/bindings/smartphone_add_binding.dart';
import 'package:smartphone_review/app/modules/smartphone_add/controllers/smartphone_add_controller.dart';

import '../controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
    Get.lazyPut<SmartphoneAddController>(() => SmartphoneAddController());
  }
}
