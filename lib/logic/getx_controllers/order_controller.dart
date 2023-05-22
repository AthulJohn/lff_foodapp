import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/models/provider_class.dart';

import '../../models/customer_class.dart';
import '../../models/order_class.dart';
import '../../models/user_class.dart';

class OrderController extends GetxController {
  OrderController(this.order);
  Order order;
  bool isCardExpanded = false;

  void toggleExpandCard() {
    if (isCardExpanded) {
      isCardExpanded = false;
    } else {
      isCardExpanded = true;
    }
    update();
  }

  // void setLocation(int location) {
  //   customer.location = location;
  // }

  // void setMaxDistance(double maxDist) {
  //   customer.maxDistance = maxDist;
  // }
}
