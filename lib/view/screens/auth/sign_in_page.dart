import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lff_foodapp/data/getx_storage.dart';
import 'package:lff_foodapp/logic/getx_controllers/user_controller.dart';
import 'package:lff_foodapp/view/components/text_fields/phone_field.dart';
import 'package:lff_foodapp/view/components/buttons/proceed_button.dart';

import '../../../constants/appColors.dart';
import '../../../models/user_class.dart';
import '../../../navigation/routes.dart';
import '../../components/title_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    GetXStorageManager.saveUserStatus(UserStatus.onBoarded);
    Get.put(UserController());
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Graphics.png"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              flex: 2,
              child: TitleText(
                blackText: "Let's get",
                greenText: "STARTED",
                size: 40,
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter your phone number"),
                    const SizedBox(
                      height: 10,
                    ),
                    PhoneField(
                      onChanged: (phone) {
                        Get.find<UserController>()
                            .setPhone(phone.completeNumber);
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: ContinueButton(
                  onPressed: () {
                    print(Get.find<UserController>().user.phone);
                    Get.snackbar("OTP Sent",
                        "OTP has been sent to your phone ${Get.find<UserController>().user.phone}");
                    Get.toNamed(Routes.otpRoute);
                  },
                  text: "Sent OTP",
                  icon: Icons.arrow_forward,
                ),
              ),
            ),
            const Spacer(
              flex: 4,
            )
          ],
        ),
      ),
    ));
  }
}
