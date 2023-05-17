import 'package:get/get.dart';

enum UserType { provider, customer }

class User {
  String phone = "";
  UserType? type;

  User.withNoType({required this.phone});
  User({required this.phone, this.type});
}
