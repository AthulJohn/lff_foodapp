import 'package:flutter/material.dart';

import 'user_class.dart';

enum OrgType { restaurant, catering, others }

class Provider extends User {
  Provider(User user) : super(phone: user.phone, type: UserType.provider);

  String? name;
  OrgType? orgType;
  int location = 0;
  String contactNumber = "";
  String? secondaryNumber;
  TimeOfDay pickupTime = const TimeOfDay(hour: 21, minute: 0);
  double pricePerMeal = 50;

  void setName(String name) {
    this.name = name;
  }

  void setOrgType(OrgType orgType) {
    this.orgType = orgType;
  }

  void setLocation(int location) {
    this.location = location;
  }

  void setContactNumber(String contactNumber) {
    this.contactNumber = contactNumber;
  }

  void setSecondaryNumber(String secondaryNumber) {
    this.secondaryNumber = secondaryNumber;
  }

  void setPickupTime(TimeOfDay pickupTime) {
    this.pickupTime = pickupTime;
  }

  void setPricePerMeal(double pricePerMeal) {
    this.pricePerMeal = pricePerMeal;
  }
}
