import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_class.dart';

enum OrgType { restaurant, catering, others }

class Provider extends User {
  Provider(User user) : super(phone: user.phone, type: UserType.provider);

  Provider.none()
      : super(
          phone: "",
        );

  String? name;
  OrgType? orgType;
  int location = 0;
  String contactNumber = "";
  String? secondaryNumber;
  TimeOfDay pickupTime = const TimeOfDay(hour: 21, minute: 0);
  double pricePerMeal = (50.0);
}
