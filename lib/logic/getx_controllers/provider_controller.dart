import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/models/provider_class.dart';

import '../../models/user_class.dart';

class ProviderController extends GetxController {
  ProviderController(User user) {
    provider = Provider(user);
  }
  Provider provider = Provider.none();

  void setName(String name) {
    provider.name = name;
  }

  void setOrgType(OrgType orgType) {
    provider.orgType = orgType;
    update();
  }

  void setLocation(int location) {
    provider.location = location;
  }

  void setContactNumber(String contactNumber) {
    provider.contactNumber = contactNumber;
  }

  void setSecondaryNumber(String secondaryNumber) {
    provider.secondaryNumber = secondaryNumber;
  }

  void setPickupTime(TimeOfDay pickupTime) {
    provider.pickupTime = pickupTime;
  }

  void setPricePerMeal(double pricePerMeal) {
    provider.pricePerMeal = pricePerMeal;
  }
}
