import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/models/provider_class.dart';
import 'package:latlong2/latlong.dart';

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

  void setSeves(int serves) {
    order.serveCount = serves;
    update();
  }

  void setOrderType(OrderType type) {
    order.orderType = type;
    update();
  }

  void setOrderTime(DateTime time) {
    order.orderTime = time;
    update();
  }

  void setName(String name) {
    order.customerName = name;
    update();
  }

  void setPhone(String phone) {
    order.customerPhone = phone;
    update();
  }

  void setLocation(LatLng location) {
    order.location = location;
  }

  bool get locationIsSet {
    return order.location != LatLng(0, 0);
  }
  // void setMaxDistance(double maxDist) {
  //   customer.maxDistance = maxDist;
  // }
}
