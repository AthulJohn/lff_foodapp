import 'package:get/get.dart';

enum UserType { provider, customer }

class User {
  RxString phone = "".obs;
  Rx<UserType>? type;

  User({required this.phone, this.type});
}
