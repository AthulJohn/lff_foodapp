import 'package:get/get.dart';

import '../../models/user_class.dart';

class UserController extends GetxController {
  UserController();
  User user = User(phone: "");

  void setPhone(String phone) {
    user.phone = phone;
  }

  void setType(UserType type) {
    user.type = type;
    update();
  }
}
