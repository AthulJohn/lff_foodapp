import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_class.dart';

enum OrgType { restaurant, catering, others }

class Customer extends User {
  Customer(User user) : super(phone: user.phone, type: UserType.customer);

  Customer.none()
      : super(
          phone: "",
        );

  String? name;
  int location = 0;
  double maxDistance = 10;
}
