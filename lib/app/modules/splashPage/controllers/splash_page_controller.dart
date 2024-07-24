import 'package:dc_interview_test/utils/logger.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    HiLog.d("Splash page is rendering");
    loadHomePage();
    super.onInit();
  }

  @override
  void onReady() {
    HiLog.d("Splash page is READY");

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadHomePage() async {
    HiLog.d("Splash page is rendering");

    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(Routes.HOME);
    });
  }
}
