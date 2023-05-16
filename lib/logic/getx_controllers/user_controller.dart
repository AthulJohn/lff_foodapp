import 'package:get/get.dart';

import '../../models/user_class.dart';

class UserController extends GetxController {
  UserController();
  User user = User(phone: "".obs);

  void setPhone(String phone) {
    user.phone.value = phone;
  }

  void setType(UserType type) {
    user.type!.value = type;
  }
}
