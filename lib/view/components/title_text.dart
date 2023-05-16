import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/appColors.dart';

class TitleText extends StatelessWidget {
  const TitleText(
      {super.key, this.greenText = "", this.blackText = "", this.size = 40});
  final String greenText;
  final String blackText;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          blackText,
          style: TextStyle(fontSize: 0.75 * size, fontWeight: FontWeight.bold),
        ),
        Text(
          greenText,
          style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        )
      ],
    );
  }
}
