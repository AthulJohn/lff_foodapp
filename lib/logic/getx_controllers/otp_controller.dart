import 'package:get/get.dart';

import '../../models/user_class.dart';

class OTPController extends GetxController {
  RxInt otp = 0.obs;

  void setOTP(int inputotp) {
    otp.value = inputotp;
  }
}
