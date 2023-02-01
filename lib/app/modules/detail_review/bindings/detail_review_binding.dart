import 'package:get/get.dart';

import '../controllers/detail_review_controller.dart';

class DetailReviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailReviewController>(
      () => DetailReviewController(),
    );
  }
}
