import 'package:get/get.dart';

extension DoubleExtension on num {
  //宽度
  double get px {
    final screenWidth = Get.width;
    return toDouble() * screenWidth / 375.0;
  }

  //高度
  double get pt {
    final screenWidth = Get.height;
    return toDouble() * screenWidth / 877.0;
  }
}
