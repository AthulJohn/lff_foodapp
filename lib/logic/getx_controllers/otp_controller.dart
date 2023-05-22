import 'package:get/get.dart';

import '../../models/user_class.dart';

class OTPController extends GetxController {
  RxInt otp = 0.obs;
  RxBool isLoading = false.obs;

  void setOTP(int inputotp) {
    otp.value = inputotp;
  }

  void load() {
    isLoading.value = true;
  }
}
