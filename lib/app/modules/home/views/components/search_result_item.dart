import 'package:dc_interview_test/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../model/language_model.dart';
import '../../controllers/home_controller.dart';

class SearchResultItem extends GetView<HomeController> {
  final LanguageModel language;

  const SearchResultItem({
    super.key,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.launchURL(language.url);
      },
      child: Container(
        height: 85.px,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80.px,
              height: 80.px,
              padding: EdgeInsets.all(10.px),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1.5.px,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.network(
                language.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 8.px,
            ),
            SizedBox(
              width: 190.px,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    language.title,
                    style: TextStyle(
                      fontSize: 16.px,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.pt),
                  Text(
                    language.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.px,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Image.asset(
                "images/share_icon.png",
                width: 25.px,
                height: 25.px,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
