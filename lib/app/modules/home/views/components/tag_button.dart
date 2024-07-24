import 'package:dc_interview_test/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/color.dart';
import '../../controllers/home_controller.dart';

class TagButton extends GetView<HomeController> {
  final String category;
  const TagButton({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.only(right: 10.px),
          child: ElevatedButton(
            onPressed: () {
              controller.onCategoryClicked(category);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: controller.isCategorySelected(category)
                  ? Colors.white
                  : MyColor.grayTextColor,
              backgroundColor: controller.isCategorySelected(category)
                  ? MyColor.primaryDarkColor
                  : MyColor.grayColor,
            ),
            child: Text(category),
          ),
        ));
  }
}
