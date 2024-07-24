
import 'package:dc_interview_test/utils/global.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/color.dart';

class NoResultPlaceholder extends StatelessWidget {
  const NoResultPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/no_result_placeholder.png',
            height: 200.px,
          ),
          SizedBox(height: 16.px),
          Text(
            'Nothing Found',
            style: TextStyle(
              fontSize: 24.px,
            ),
          ),
          SizedBox(height: 8.px),
          Text(
            "We couldn't find what you were looking for.",
            style: TextStyle(
              fontSize: 14.px,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.px),
          Text(
            'Keep calm and search again. We use so many other cool stuff, surely we use something you like.',
            style: TextStyle(
              fontSize: 14.px,
              color: MyColor.grayTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}