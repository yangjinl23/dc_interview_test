import 'package:dc_interview_test/utils/global.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/color.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/error_placeholder.png',
            height: 200.px,
          ),
          SizedBox(height: 16.px),
          Text(
            'Aaah! Something went wrong',
            style: TextStyle(
              fontSize: 24.px,
            ),
          ),
          SizedBox(height: 8.px),
          Text(
            'Brace yourself till we get the error fixed.',
            style: TextStyle(
              fontSize: 14.px,
              color: MyColor.grayTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.px),
          Text(
            'You may also refresh the page or try again later.',
            style: TextStyle(
              fontSize: 14.px,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}