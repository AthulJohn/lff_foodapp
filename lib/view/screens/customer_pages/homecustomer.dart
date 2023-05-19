import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/navigation/routes.dart';
import 'package:lff_foodapp/view/screens/customer_pages/order_food.dart';

import '../../../constants/graphics.dart';
import '../../components/buttons/home_page_button.dart';
import 'orderpage.dart';
// import 'package:lff_foodapp/constants/graphics.dart';

class HomeCustomer extends StatelessWidget {
  const HomeCustomer({super.key});

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
        Positioned(
          top: 85,
          left: 20,
          height: Get.width * 0.2,
          width: Get.width * 0.4,
          child: Image.asset(homeSloganCustomer),
        ),
        HomePageButtons(
          top: Get.width * 0.53,
          bottom: Get.width * 0.67,
          left: Get.width * 0.1,
          right: -Get.width * 0.1,
          icon: order,
          onTap: () {
            Get.toNamed(Routes.customerOrder);
          },
          alignment: Alignment.center,
        ),
        HomePageButtons(
          bottom: -Get.width * 0.5,
          left: -Get.width * 0.5,
          height: Get.width * 1.2,
          width: Get.width * 1.2,
          icon: previousOrders,
          onTap: () {
            Get.toNamed(Routes.previousorder);
          },
          alignment: Alignment.centerRight,
        ),
        HomePageButtons(
          top: -Get.width * 0.6,
          right: -Get.width * 0.75,
          height: Get.width * 1.2,
          width: Get.width * 1.2,
          icon: account,
          onTap: () {
            Get.toNamed(Routes.customerAccount);
          },
          alignment: Alignment.centerLeft,
        ),
        // Image.asset(homeSloganCustomer),
        // Image.asset(account),
        // Image.asset(order),
        // Image.asset(previousOrders),
      ],
    ));
  }
}
