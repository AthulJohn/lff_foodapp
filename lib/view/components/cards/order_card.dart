import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/constants/appColors.dart';
import 'package:lff_foodapp/constants/graphics.dart';
import 'package:lff_foodapp/logic/getx_controllers/order_controller.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';

import '../../../models/order_class.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orderDetails});
  final Order orderDetails;

  String orderTypeToString() {
    switch (orderDetails.orderType) {
      case OrderType.veg:
        return 'Veg';
      case OrderType.nonVeg:
        return 'Non Veg';
      case OrderType.vegan:
        return 'Vegan';
    }
  }

  String dateTimeToString() {
    int hour = orderDetails.orderTime.hour;
    return "${((hour - 1) % 12 + 1)}:${orderDetails.orderTime.minute < 10 ? '0' : ''}${orderDetails.orderTime.minute} ${orderDetails.orderTime.hour < 12 ? 'AM' : 'PM'}";
  }

  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.put(OrderController(orderDetails));
    return Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderColor, width: 2),
        ),
        child: InkWell(
          onTap: () {
            orderController.toggleExpandCard();
          },
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: AspectRatio(
                        aspectRatio: 1.25,
                        child: Image.asset(
                          orderDetails.orderType == OrderType.veg
                              ? 'assets/images/Veg.png'
                              : orderDetails.orderType == OrderType.nonVeg
                                  ? 'assets/images/NonVeg.png'
                                  : 'assets/images/Vegan.png',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            orderDetails.customerName.toUpperCase(),
                            style: const TextStyle(
                                color: AppColors.primaryColor, fontSize: 18),
                          ),
                          Text(
                            "${orderDetails.serveCount} ${orderTypeToString()} Serves Ordered",
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            "Ordered at ${dateTimeToString()}",
                            style: const TextStyle(
                                fontSize: 10, color: AppColors.borderColor),
                          ),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  AppOutlineButton(
                    onPressed: () {},
                    text: "Mark as Done",
                  ),
                  AppOutlineButton(onPressed: () {}, text: "Deny Order"),
                  AppOutlineButton(onPressed: () {}, text: "Contact Customer"),
                ],
              )
            ],
          ),
        ));
  }
}
