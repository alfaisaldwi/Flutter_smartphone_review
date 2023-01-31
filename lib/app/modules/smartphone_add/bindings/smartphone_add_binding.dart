import 'package:get/get.dart';

import '../controllers/smartphone_add_controller.dart';

class SmartphoneAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmartphoneAddController>(
      () => SmartphoneAddController(),
    );
  }
}
