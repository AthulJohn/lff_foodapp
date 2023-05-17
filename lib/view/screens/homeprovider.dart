import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/graphics.dart';
// import 'package:lff_foodapp/constants/graphics.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // SvgPicture.asset(homeSloganCustomer),
        // SvgPicture.asset(account),
        // SvgPicture.asset(order),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(graphicsFaded),
          ),
        ),
        Positioned.fill(
          top: 85,
          left: 20,
          child: Align(
            alignment: Alignment.topLeft,
            child: Image.asset(homeSloganProvider),
          ),
        ),
        HomePageButtons(
          top: -25,
          icon: updateStatus,
          onTap: () {
            print('order');
          },
          alignment: Alignment.center,
        ),
        HomePageButtons(
          icon: currentOrders,
          onTap: () {
            print("Previous Orders");
          },
          alignment: Alignment.bottomLeft,
        ),
        HomePageButtons(
          icon: account,
          onTap: () {
            print("Account");
          },
          alignment: Alignment.topRight,
        ),
        // Image.asset(homeSloganCustomer),
        // Image.asset(account),
        // Image.asset(order),
        // Image.asset(previousOrders),
      ],
    ));
  }
}

class HomePageButtons extends StatelessWidget {
  final Alignment alignment;
  final String icon;
  final VoidCallback onTap;
  int top = 0;
  int left = 0;

  HomePageButtons(
      {super.key,
      this.top = 0,
      this.left = 0,
      required this.icon,
      required this.onTap,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: top.toDouble(),
      left: left.toDouble(),
      child: Align(
        alignment: alignment,
        child: InkWell(
          onTap: onTap,
          splashFactory: NoSplash.splashFactory,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          // overlayColor: Colors.transparent,
          highlightColor: Colors.transparent,

          child: Image.asset(icon),
        ),
      ),
    );
  }
}
