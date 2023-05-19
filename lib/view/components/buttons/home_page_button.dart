import 'dart:math';

import 'package:flutter/material.dart';

class HomePageButtons extends StatelessWidget {
  final Alignment alignment;
  final String icon;
  final VoidCallback onTap;
  double? top, left, right, bottom, height, width;

  HomePageButtons(
      {super.key,
      this.top,
      this.left,
      this.right,
      this.bottom,
      this.height,
      this.width,
      required this.icon,
      required this.onTap,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      height: height,
      width: width,
      bottom: bottom,
      right: right,
      child: Transform.rotate(
        angle: -pi / 4,
        child: InkWell(
          onTap: onTap,
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          // overlayColor: Colors.transparent,
          highlightColor: Colors.transparent,

          child: Image.asset(
            icon,
            alignment: alignment,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
